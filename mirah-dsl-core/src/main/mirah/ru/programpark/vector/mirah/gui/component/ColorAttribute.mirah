package ru.programpark.vector.mirah.gui.component

import ru.programpark.mirah.extensions.ABase
import ru.programpark.mirah.extensions.ABuilder
import ru.programpark.mirah.extensions.ALogger

# ��������� ����� ������� �������� �������� ���� ����.
class ColorAttribute
  implements ALogger

  def initialize(a:AttributeDescriptor, c:ABase)
    a.build
    descr =  a.map_from.build
    log "init color attribute: #{descr} #{a} #{c}"
  end

  def color(c:String)
    log "color set: #{c}"
  end
end


