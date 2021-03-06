package ru.programpark.vector.mirah.gui.component


/**
 * 
  Нужна java8 и последний mirahc. Собирать приходится последовательно:
  
  java ru.programpark.mirah.dsl.test.FactoryTest

  mirahc -new-closures Macro.mirah && mirahc -new-closures ALabel.mirah && mirahc -new-closures CustomLabel.mirah && mirahc -new-closures FactoryTest.mirah
 *
 * @author Markov, markovs@programpark.ru
 * Created on 02.04.2015, 16:42
 */
class FactoryTest
  
  def assemble:void 
    panel = APanelFactory.create do  
      add ALabel do
        text "test" do
          map_from do
            "new text"
          end
        end	
        color do
          map_from do
            "red 2"
          end
        end
      end
      
      add ALabel do
        text "test" 
      end
      
      add APanel do
        layout "border"
/**/      
        add CustomLabel do
          /**/                
	        text "test" do 
            map_from do
              "custom text"
            end			
          end	
          #*/                  
        end	
#*/        
        add ALabel do
          text "in panel test" 
        end	   
      end
    end  
    
    #panel.build
    puts "panel: #{panel}"
  end
  
  def self.main(args:String[]):void
    #puts AttributeDescriptorFactory.class
    #puts CustomLabelFactory.class
    FactoryTest.new.assemble
  end
end


