package ru.programpark.vector.mirah.gui.comp

import ru.programpark.vector.mirah.gui.component.Scene
import ru.programpark.vector.mirah.gui.component.SceneDSL

/**
 *
 * @author pycckuu
 */
class CompTests  

    def self.main(args:String[]):void
        #handler_test
        scene_test
    end	
    
    def self.scene_test
        param1 = 123
        #what = :Cross
        scene = Scene.create :Tabbed do    
            puts "param = #{param1}"
            puts "Scene.create do\nend"
            
            what = :Card
            panel = add what do
                puts "param = #{param1}"
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

