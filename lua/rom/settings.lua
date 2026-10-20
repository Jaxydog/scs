local imports = {
    expect = require('cc.expect'),
}

--- Defines global settings for the `scs` library.
local exports = {}

--- Defines a new setting.
---
--- @generic T
---
--- @param name string The setting's name.
--- @param options cc.settings.Options The setting's options.
---
--- @return scs.settings.Setting<T> setting The new setting.
function exports.new(name, options)
    imports.expect.expect(1, name, 'string')
    imports.expect.expect(2, options, 'table')

    imports.expect.field(options, 'description', 'nil', 'string')
    imports.expect.field(options, 'default', 'nil', 'number', 'string', 'boolean', 'table')
    imports.expect.field(options, 'type', 'nil', 'string')

    if options.default ~= nil then
        local valueType = type(options.default) --- @as cc.settings.Options.Type

        if options.type == nil then
            options.type = valueType
        else
            assert(options.type == valueType, ('bad type (expected %s, got %s)'):format(options.type, valueType))
        end
    end

    --- A custom setting that is defined upon creation.
    ---
    --- @class scs.settings.Setting<T>
    ---
    --- @overload fun(): T?
    local setting = {}

    --- The setting's name.
    ---
    --- @public
    --- @readonly
    setting.name = name

    --- The setting's options.
    ---
    --- @private
    --- @readonly
    setting.options = options

    --- Returns whether the setting is currently defined.
    ---
    --- @return boolean defined Whether the setting is defined.
    function setting:isDefined()
        for _, settingName in ipairs(settings.getNames()) do
            if settingName == self.name then
                return true
            end
        end

        return false
    end

    --- Defines the setting.
    function setting:define()
        settings.define(self.name, self.options)
    end

    --- Undefines the setting.
    function setting:undefine()
        settings.undefine(self.name)
    end

    --- Returns the current value of the setting.
    ---
    --- @param default? T A default value, if the setting is not defined.
    ---
    --- @return T? value The setting's configured value.
    function setting:get(default)
        if self.options.type ~= nil then
            imports.expect.expect(1, default, 'nil', self.options.type)
        end

        return settings.get(self.name, default)
    end

    --- Returns the setting's default value.
    ---
    --- @return T? default The setting's default value.
    function setting:getDefault()
        return self.options.default
    end

    --- Returns details about the setting.
    ---
    --- @return cc.settings.Details details The setting's details.
    function setting:getDetails()
        return settings.getDetails(self.name)
    end

    --- Returns whether this setting is currently configured to be its default value.
    ---
    --- If this setting was defined without a default value, this will return `false`.
    ---
    --- @return boolean default Whether this setting's value is the default.
    function setting:isDefault()
        return self.options.default ~= nil and self:get() == self.options.default
    end

    --- Returns whether this setting has been modified.
    ---
    --- This will return `true` if:
    ---
    --- - This setting was defined without a default value, and is currently set.
    --- - This setting's configured value deviates from its default value.
    ---
    --- @return boolean modified Whether the setting is modified.
    function setting:isModified()
        return self:get() ~= self.options.default
    end

    if not setting:isDefined() then
        setting:define()
    end

    return setmetatable(setting, {
        __call = setting.get,
        __tostring = function(t) return t.name end,
    })
end

exports.root = exports.new('scs.root', {
    type = 'string',
    default = '/.scs-root',
    description = 'The root directory containing the installed SCS libraries',
}) --- @as scs.settings.Setting<string>

exports.test = exports.new('scs.test', {
    type = 'boolean',
    default = false,
    description = 'A flag that informs SCS libraries that they are running under a testing environment',
}) --- @as scs.settings.Setting<boolean>

return exports
