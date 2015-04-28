package ru.programpark.vector.mirah.gui.component

import ru.programpark.vector.mirah.gui.component.Scene
import ru.programpark.vector.mirah.gui.component.SceneDSL

/**
 *
 * @author pycckuu
 */
class Tests  

    def self.main(args:String[]):void
        #handler_test
        scene_test
    end	
    
    def self.scene_test
        param = 123
        #what = :Cross
        scene = Scene.create :Tabbed do    
            puts "param = #{param}"
            puts "Scene.create do\nend"
            
            what = :Card
            panel = add what do
                puts "param = #{param}"
                puts "add #{what}"
                cde = 123456
                add 'aa' do
                    abc = 'xxx'
                    puts "second level"
                end
                add 'aa' do
                    abc = 'bbb'
                    puts "second level"
                end
            end
            puts "panel implements SceneDSL is #{panel.kind_of? SceneDSL}"
            
        end
        puts "scene implements SceneDSL is #{scene.kind_of? SceneDSL}"
    end
end

