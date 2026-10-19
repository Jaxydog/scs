--- [Official Documentation](https://tweaked.cc/module/settings.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/settings.html)
---
--- Read and write configuration options for CraftOS and your programs.
---
--- When a computer starts, it reads the current value of settings from the `/.settings` file.
--- These values then may be read or modified.
---
--- Any modifications to a settings, either from loading a file (`settings.load`) or directly setting it
--- (`settings.set`, `settings.unset`) will queue a `setting_changed` event.
--- This may be listened to by programs to reload settings while running.
---
--- > [!WARNING]
--- > Calling `settings.set` does not update the settings file by default.
--- > You must call `settings.save` to persist values.
---
--- # Usage
---
--- - Define a basic setting as `123` and read its value.
---
--- ```lua
--- settings.define('my.setting', {
---     description = 'An example setting',
---     default = 123,
---     type = 'number',
--- })
---
--- print(('my.setting = %d'):format(settings.get('my.setting')))
--- ```
---
--- # Changes
---
--- - New in version 1.78
--- - Changed in version 1.87.0: `setting_changed` event is not queued when settings are changed.
---
--- @see cc.os.Event.SettingChanged
settings = {}

--- [Official Documentation](https://tweaked.cc/module/settings.html#v:define)
---
--- Define a new setting, optional specifying various properties about it.
---
--- While settings do not have to be added before being used, doing so allows you to provide defaults
--- and additional metadata.
---
--- # Changes
---
--- - New in version 1.87.0
---
--- @param name string The name of this option.
--- @param options? cc.settings.Options Options for this setting.
function settings.define(name, options) end

--- [Official Documentation](https://tweaked.cc/module/settings.html#v:undefine)
---
--- Remove a definition of a setting.
---
--- If a setting has been changed, this does not remove its value. Use `settings.unset` for that.
---
--- # Changes
---
--- - New in version 1.87.0
---
--- @param name string The name of this option.
function settings.undefine(name) end

--- [Official Documentation](https://tweaked.cc/module/settings.html#v:get)
---
--- Get the value of a setting.
---
--- # Changes
---
--- - Changed in version 1.87.0: Now respects default value if predefined and `default` is unset.
---
--- @param name string The name of the setting to get.
--- @param default? any The value to use should there be pre-existing value for this setting.
--- If not given, it will use the setting's default value if given, or `nil` otherwise.
---
--- @return any value The setting's, or the default if the setting has not been changed.
function settings.get(name, default) end

--- [Official Documentation](https://tweaked.cc/module/settings.html#v:getDetails)
---
--- Get details about a specific setting.
---
--- # Changes
---
--- - New in version 1.87.0
---
--- @param name string The name of the setting to get.
---
--- @return cc.settings.Details Information about this setting.
function settings.getDetails(name) end

--- [Official Documentation](https://tweaked.cc/module/settings.html#v:set)
---
--- Set the value of a setting.
---
--- > [!WARNING]
--- > Calling `settings.set` does not update the settings file by default.
--- > You must call `settings.save` to persist values.
---
--- # Throws
---
--- - If this value cannot be serialized.
---
--- @param name string The name of the setting to set.
--- @param value any The setting's value. This cannot be `nil`, and must be serializable by `textutils.serialize`.
---
--- @see settings.unset()
function settings.set(name, value) end

--- [Official Documentation](https://tweaked.cc/module/settings.html#v:unset)
---
--- Remove the value of a setting, setting it to the default.
---
--- `settings.get` will return the default value until the setting's value is set, or the computer is rebooted.
---
--- @param name string The name of the setting to unset.
---
--- @see settings.clear()
--- @see settings.set()
function settings.unset(name) end

--- [Official Documentation](https://tweaked.cc/module/settings.html#v:clear)
---
--- Resets the value of all settings. Equivalent to calling `settings.unset` on every setting.
---
--- @see settings.unset()
function settings.clear() end

--- [Official Documentation](https://tweaked.cc/module/settings.html#v:getNames)
---
--- Get the names of all currently defined settings.
---
--- @return string[] names An alphabetically sorted list of all currently-defined settings.
function settings.getNames() end

--- [Official Documentation](https://tweaked.cc/module/settings.html#v:load)
---
--- Load settings from the given file.
---
--- Existing settings will be merged with any preexisting ones.
--- Conflicting entries will be overwritten, but any others will be preserved.
---
--- # Changes
---
--- - Changed in version 1.87.0: `path` is now optional.
---
--- @param path? string The file to load from (default `'.settings'`).
---
--- @return boolean success Whether settings were successfully read from this file.
--- Reasons for failure may include the file not existing or being corrupted.
---
--- @see settings.save()
function settings.load(path) end

--- [Official Documentation](https://tweaked.cc/module/settings.html#v:save)
---
--- Save settings to the given file.
---
--- This will entirely overwrite the preexisting file.
--- Settings defined in the file, but not currently loaded will be removed.
---
--- # Changes
---
--- - Changed in version 1.87.0: `path` is now optional.
---
--- @param path? string The path to save settings to (default `'.settings'`).
---
--- @return boolean success If the settings were successfully saved.
---
--- @see settings.load()
function settings.save(path) end
