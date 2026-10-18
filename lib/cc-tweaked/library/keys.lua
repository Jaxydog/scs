--- [Official Documentation](https://tweaked.cc/module/keys.html)
---
--- @meta

--- @type integer
local builtin = nil

--- [Official Documentation](https://tweaked.cc/module/keys.html)
---
--- Constants for all keyboard "key codes", as queued by the `key` event.
---
--- These values are not guaranteed to remain the same between versions.
--- It is recommended that you use the constants provided by this file, rather than the underlying numerical values.
---
--- # Changes
---
--- - New in version 1.4
keys = {
    space = builtin,
    apostrophe = builtin,
    comma = builtin,
    minus = builtin,
    period = builtin,
    slash = builtin,
    zero = builtin,
    one = builtin,
    two = builtin,
    three = builtin,
    four = builtin,
    five = builtin,
    six = builtin,
    seven = builtin,
    eight = builtin,
    nine = builtin,
    semicolon = builtin,
    equals = builtin,
    a = builtin,
    b = builtin,
    c = builtin,
    d = builtin,
    e = builtin,
    f = builtin,
    g = builtin,
    h = builtin,
    i = builtin,
    j = builtin,
    k = builtin,
    l = builtin,
    m = builtin,
    n = builtin,
    o = builtin,
    p = builtin,
    q = builtin,
    r = builtin,
    s = builtin,
    t = builtin,
    u = builtin,
    v = builtin,
    w = builtin,
    x = builtin,
    y = builtin,
    z = builtin,
    leftBracket = builtin,
    backslash = builtin,
    rightBracket = builtin,
    grave = builtin,
    enter = builtin,
    tab = builtin,
    backspace = builtin,
    insert = builtin,
    delete = builtin,
    right = builtin,
    left = builtin,
    down = builtin,
    up = builtin,
    pageUp = builtin,
    pageDown = builtin,
    home = builtin,
    ['end'] = builtin,
    capsLock = builtin,
    scrollLock = builtin,
    numLock = builtin,
    printScreen = builtin,
    pause = builtin,
    f1 = builtin,
    f2 = builtin,
    f3 = builtin,
    f4 = builtin,
    f5 = builtin,
    f6 = builtin,
    f7 = builtin,
    f8 = builtin,
    f9 = builtin,
    f10 = builtin,
    f11 = builtin,
    f12 = builtin,
    f13 = builtin,
    f14 = builtin,
    f15 = builtin,
    f16 = builtin,
    f17 = builtin,
    f18 = builtin,
    f19 = builtin,
    f20 = builtin,
    f21 = builtin,
    f22 = builtin,
    f23 = builtin,
    f24 = builtin,
    f25 = builtin,
    numPad0 = builtin,
    numPad1 = builtin,
    numPad2 = builtin,
    numPad3 = builtin,
    numPad4 = builtin,
    numPad5 = builtin,
    numPad6 = builtin,
    numPad7 = builtin,
    numPad8 = builtin,
    numPad9 = builtin,
    numPadDecimal = builtin,
    numPadDivide = builtin,
    numPadMultiply = builtin,
    numPadSubtract = builtin,
    numPadAdd = builtin,
    numPadEnter = builtin,
    numPadEqual = builtin,
    leftShift = builtin,
    leftCtrl = builtin,
    leftAlt = builtin,
    leftSuper = builtin,
    rightShift = builtin,
    rightCtrl = builtin,
    rightAlt = builtin,
    menu = builtin,
}

--- [Official Documentation](https://tweaked.cc/module/keys.html#v:getName)
---
--- Translates a numerical key code to a human-readable name.
--- The human-readable name is one of the constants in the keys API.
---
--- # Usage
---
--- - Print the name of the `enter` key constant.
---
--- ```lua
--- print(keys.getName(keys.enter))
--- -- => 'enter'
--- ```
---
--- @param code integer The key code to look up.
---
--- @return string? name The name of the key, or `nil` if not a valid key code.
function keys.getName(code) end
