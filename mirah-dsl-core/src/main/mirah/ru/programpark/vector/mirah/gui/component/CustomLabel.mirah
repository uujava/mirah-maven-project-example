package ru.programpark.vector.mirah.gui.component

/**
 *
 * @author Markov, markovs@programpark.ru
 * Created on 02.04.2015, 16:40
 */
factory class CustomLabel < ALabel

  def initialize
    super
    puts "CustomLabel.initialize"
    text "CLT4"
    begin
      #raise "CCC"
    rescue Exception => err
      err.printStackTrace
    end
  end

end


