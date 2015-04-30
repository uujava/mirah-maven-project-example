package ru.programpark.vector.mirah.gui.component

import ru.programpark.mirah.extensions.ABase
import ru.programpark.mirah.extensions.ABuilder
import ru.programpark.mirah.extensions.ALogger

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
