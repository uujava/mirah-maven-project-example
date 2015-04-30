package ru.programpark.vector.mirah.gui.component

import ru.programpark.mirah.extensions.ABase
import ru.programpark.mirah.extensions.ABuilder
import ru.programpark.mirah.extensions.ALogger

# ��������� ����� � DSL ������������� ����������� ��������
factory class AttributeDescriptor < ABuilder

	def map_from:MapFromDescriptor
		@_map_from
	end

	def map_from(m:MapFromDescriptor):void
        m.build
		@_map_from = m
		log "map from created: #{m}"
  end

end