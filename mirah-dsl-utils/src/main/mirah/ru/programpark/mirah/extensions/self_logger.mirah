package ru.programpark.mirah.extensions

import java.util.logging.Logger
import java.util.logging.Level

class SelfLogger
 
 def initialize(clazz:Class)
     @logger = Logger.getLogger clazz.getName
 end

def initialize(pkg:String)
     @logger = Logger.getLogger pkg
 end

 def debug(var:String):void
     @logger.log(Level.FINE, var)
 end     

 def debug?
    @logger.isLoggable(Level.FINE)
 end
    
 def info(var:String):void
     @logger.log(Level.INFO,var)
 end     
 
 def info?
     @logger.isLoggable(Level.INFO)
 end
 
 def error(var:String):void
     @logger.log(Level.SEVERE,var)
 end     
 
 def error?
     @logger.isLoggable(Level.SEVERE)
 end
 
end