package ru.programpark.vector.mirah.gui.component

/**
TODO move imports to factory macros
*/
import ru.programpark.mirah.extensions.ABase
import ru.programpark.mirah.extensions.ABuilder
import ru.programpark.mirah.extensions.ALogger

/**
 *
 * @author Markov, markovs@programpark.ru
 * Created on 02.04.2015, 16:30
 */

# Системный класс и DSL метки.
factory class ALabel < ABase

  def text(s:String, descr:AttributeDescriptor = nil):void
    TextAttribute.new(s, descr, self)
  end

  def color(descr:AttributeDescriptor):void
    ColorAttribute.new(descr, self)
  end
end
