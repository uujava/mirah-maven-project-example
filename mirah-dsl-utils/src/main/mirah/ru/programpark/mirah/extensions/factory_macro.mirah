package ru.programpark.mirah.extensions

/**
 *
 * @author Markov, markovs@programpark.ru
 * Created on 02.04.2015, 16:17
 */
interface ALogger
  
  def log(msg:String):void
    puts "#{toString}: #{msg}"
  end  

  def toString:String;end
end

# Базовый интерфейс всех билдеров
interface FactoryBuilder  
  def build:void;end   
end

# Базовый класс для конструирования вложенных в DSL замыканий
abstract class ABuilder
  implements FactoryBuilder, ALogger            

  macro def add(clazz:NodeList, block:Block):Node                          
    target = Constant.new(clazz.position, SimpleString.new("#{Constant(clazz.get(0)).identifier}Factory"))        
    _call = Call.new(clazz.position, target, SimpleString.new("create"),[], block)        
    Call.new(clazz.position, Self.new(clazz.position), SimpleString.new('add'), [_call], nil)
  end

end

# Базовый класс дескриптора компонента, он же свой собственный DSL (DSL должен быть абстрактным)
abstract class ABase 
  implements FactoryBuilder, ALogger

  macro def add(clazz:NodeList, block:Block):Node                          
    target = Constant.new(clazz.position, SimpleString.new("#{Constant(clazz.get(0)).identifier}Factory"))        
    _call = Call.new(clazz.position, target, SimpleString.new("create"),[], block)        
    Call.new(clazz.position, Self.new(clazz.position), SimpleString.new('add'), [_call], nil)
  end
 
end

# Собственно макрос автоматического создания класса фабрики для компонента

import org.mirah.macros.anno.ExtensionsRegistration
$ExtensionsRegistration[['java.lang.Object']]
class FactoryMacro
  
  macro def self.factory(clazz:ClassDefinition):Node    
     
    abstract_anno = Annotation.new(
       @call.name.position, 
       Constant.new(SimpleString.new('org.mirah.jvm.types.Modifiers')),
       [HashEntry.new(SimpleString.new('flags'), Array.new([SimpleString.new('ABSTRACT')]))]
    )

    clazz.annotations.add abstract_anno   
  

    cname = clazz.name.identifier

    mthd = quote {
      def self.create(a:`cname`):`cname`
        a.build
        return a 
      end        
    }   

    #@mirah.typer.infer(@call.target)

    # create factory class with single method 
    fname = SimpleString.new("#{cname}Factory")    
	fclazz = ClassDefinition.new(fname, nil, [mthd], [], nil, nil)
	result = NodeList.new
	result.add clazz
	result.add fclazz

    return result
  end   
end

