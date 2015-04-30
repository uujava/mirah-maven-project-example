package ru.programpark.vector.mirah.gui.component

import ru.programpark.mirah.extensions.ABase
import ru.programpark.mirah.extensions.ABuilder
import ru.programpark.mirah.extensions.ALogger

# Системный класс и DSL панели (контейнера)
factory class APanel < ABase

  def layout(s:String):void
    @layout = s
  end

  def add(c:ABase):void
    log "added #{c}"
  end
end
