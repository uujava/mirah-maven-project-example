package ru.programpark.mirah.tools

import org.mirah.jvm.mirrors.debug.ConsoleDebugger
import mirah.lang.ast.StringCodeSource
import org.mirah.jvm.compiler.BytecodeConsumer
import org.mirah.tool.MirahArguments
import org.mirah.tool.MirahCompiler
import java.util.Scanner

import java.net.URLClassLoader
import java.util.Arrays
import java.net.URL

interface Script
    def eval:void;end
end

class ByteClassLoader < URLClassLoader     

    def initialize(parent:ClassLoader)
      super(URL[0], parent)
      @class_map = {}
    end   
            
    def add(name:String, bytes:byte[]):void
       name = name.replaceAll '/', '.' 
       @class_map[name] = bytes 
    end
    
    def contains(name:String):boolean
        @class_map.containsKey(name)
    end
    
    def findClass(name:String):Class
      puts "find class: #{name}"
      bytes = byte[].cast(@class_map[name])
      if bytes           
        defineClass(name, bytes, 0, bytes.length)
      else
        super
      end
    end
end

class Mirb implements BytecodeConsumer
    
    def initialize
        super                
    end
    
    def init_compiler(args: String[]):void
       @gen = 0
       @loader = ByteClassLoader.new(self.class.getClassLoader)       
       
       @compiler_args=MirahArguments.new        
       @compiler_args.setup_logging 

        if @compiler_args.use_type_debugger && !@debugger
            debugger = ConsoleDebugger.new
            debugger.start
            @debugger = debugger.debugger
        end

        diagnostics = @compiler_args.diagnostics

        diagnostics.setMaxErrors(@compiler_args.max_errors)

        classpath = URLClassLoader(Thread.currentThread.getContextClassLoader).getURLs
          
        @compiler = MirahCompiler.new(
            diagnostics,
            @compiler_args.jvm_version,
            classpath,
            @compiler_args.real_bootclasspath,
            @compiler_args.real_macroclasspath,
            @compiler_args.destination,
            @compiler_args.real_macro_destination,
            @debugger,
            @compiler_args.use_new_closures)    
    end
    
    def self.main(args:String[]):void
        c = Mirb.new 
        c.init_compiler(args)
        s = Scanner.new(System.in)        
        puts "Hint: Use [:e - eval text block|:c - compile text block|:n - new classloader|:q - quit] commands on a separate line"
        sb = StringBuilder.new        
        while true
            line = s.nextLine()
            if line.equals(':e') 
                c.eval(sb.toString)                                    
                sb.setLength 0
                next
            elsif line.equals ':c'
                c.compile(sb.toString)                                    
                sb.setLength 0
                next
            elsif line.equals ':n'
                c.init_compiler(args)                                    
                sb.setLength 0
                next    
            elsif line.equals ':q'
               System.exit 0                          
            end            
            sb.append(line)
            sb.append("\n")
        end
    end
    
    def eval(code:String):void
        @gen+=1
        scriptName = "#{@@SCRIPT_PREFIX}#{@gen}"
        code = "class #{scriptName} implements dsl.Script
             def eval
               #{code}
             end
        end"
       Script(@loader.findClass(scriptName).newInstance).eval if call_compile(code) == 0       
    rescue Throwable => ex
        puts "unable to eval: #{ex}"
        ex.printStackTrace
    end
        
    def compile(code:String):void       
       call_compile(code) 
    end
    
    def call_compile(code:String):int             
        @compiler.parse(StringCodeSource.new('DashE', code))
        @compiler.infer
        @compiler.compile(self) 
        return 0
    rescue Throwable => ex
          puts "Unable to compile: #{ex}"
          ex.printStackTrace
        return 1  
    end
    
    @@SCRIPT_PREFIX='Gen_S'
      
    def consumeClass(filename:String, bytes:byte[]):void                                                       
        unless @loader.contains(filename)
            puts "defining class: #{filename}"
            @loader.add(filename, bytes)            
        end
     rescue Throwable => e
        puts "Unable to eval: #{e}"
        e.printStackTrace
    end

end

