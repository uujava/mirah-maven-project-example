package ru.programpark.vector.mirah.gui.component

import ru.programpark.mirah.extensions.ABase
import ru.programpark.mirah.extensions.ABuilder
import ru.programpark.mirah.extensions.ALogger

# ��������� ����� ������� �������� �������� ���� �����.
class TextAttribute
  implements ALogger

  def initialize(s:String, a:AttributeDescriptor, c:ABase)
    log "init text attribute: #{s} #{a} #{c}"
    @text = s
  end

  def text
    @text
  end
end
