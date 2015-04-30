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


# Системный класс и DSL панели (контейнера)
factory class APanel < ABase

  def layout(s:String):void
    @layout = s
  end

  def add(c:ABase):void
    log "added #{c}"
  end
end

# Системный класс парсера значений атрибута типа текст.
class TextAttribute
  #implements ALogger
  def log(msg:String):void
    puts "#{toString}: #{msg}"
  end

  def initialize(s:String, a:AttributeDescriptor, c:ABase)
    log "init text attribute: #{s} #{a} #{c}"
    @text = s
  end

  def text
    @text
  end
end

# Системный класс парсера значений атрибута типа цвет.
class ColorAttribute
  #implements ALogger
  def log(msg:String):void
    puts "#{toString}: #{msg}"
  end

  def initialize(a:AttributeDescriptor, c:ABase)
    log "init color attribute: #{a.map_form.build} #{a} #{c}"
  end

  def color(c:String)
    log "color set: #{c}"
  end
end


