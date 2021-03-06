package ru.programpark.vector.mirah.gui.component

import java.lang.Integer


/**
 *
 * @author Markov, markovs@programpark.ru
 * Created on 23.03.2015, 13:16
 */
class Scene 
    
    def self.create type:String, block:SceneDSL
        block.type = type 
        block.execute
    end    
end

abstract class SceneDSL
    
    attr_reader type:String
    
    # У замыканий должен быть пустой конструктор
    def initialize
        puts "SceneDSL.initialize #{Integer.toHexString self.hashCode}" 
        @type = :Panel
        puts "@type = :#{type}" 
    end
    
    def type= type:String
        puts "type = :#{type}"
        @type = type
    end
    
    abstract def execute;end

    def add type:String, scene:SceneDSL
        scene.type = type
        scene.execute
    end
end