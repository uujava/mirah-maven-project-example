package ru.programpark.mirah.extensions

import org.mirah.builtins.ExtensionsService
import org.mirah.builtins.ExtensionsProvider

class StlExtensions
    implements ExtensionsProvider

    def register(service: ExtensionsService)
        service.macro_registration FactoryMacro.class
    end
end

