package ru.programpark.vector.mirah.gui.component

import ru.programpark.mirah.extensions.ABase
import ru.programpark.mirah.extensions.ABuilder
import ru.programpark.mirah.extensions.ALogger

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


