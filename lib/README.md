# Lua Libraries

This directory contains various definition libraries used by
this project for the sake of documentation and in-editor autocompletion.

None of these libraries should contain actual code,
only documentation that describes an API provided by ComputerCraft
or one of its add-on mods.

## Library Structure

Each contained library should have the following directory structure:

```
<library name>/
- library/
- config.json
```

The `config.json` configuration file should use the [LuaLS Add-on Configuration Schema][1] and
have the following entry in its `settings` map:

```
"Lua.runtime.version": "Lua 5.3"
```

[1]: https://raw.githubusercontent.com/LuaLS/LLS-Addons/main/schemas/addon_config.schema.json
