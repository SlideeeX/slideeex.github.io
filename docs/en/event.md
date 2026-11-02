# guic::Event
A structure describing an input or window event – event type, key modifiers, window identifier and event data

## Fields

|Type|Field|Purpose|Label|
|---|----|----------|-----|
|EventType|type|Event type (default `EventType::None`)|<span class="green-stable">stable</span>|
|mods|mods|State of the key modifiers at the moment of the event|<span class="green-stable">stable</span>|
|Uint32|winId|Identifier of the window where the event happened (default 0)|<span class="green-stable">stable</span>|
|Uint32|customId|Identifier of a custom event. The range 100000–999999 is reserved for Guic, 0–99999 is for main development|<span class="green-stable">stable</span>|
|std::vector<std::string>|filePaths|Paths to files for a file drop event|<span class="green-stable">stable</span>|
|data|data|Event data, its contents depend on `type`|<span class="green-stable">stable</span>|

## Enumeration Event::EventType

|Name|Purpose|Label|
|--------|----------|-----|
|None|No event, or a failed recognition|<span class="green-stable">stable</span>|
|Custom|A custom event. Its identifier is set in `customId`|<span class="green-stable">stable</span>|
|KeyPressed|A key was pressed|<span class="green-stable">stable</span>|
|KeyReleased|A key was released|<span class="green-stable">stable</span>|
|MouseMoved|The mouse moved|<span class="green-stable">stable</span>|
|MouseButtonPressed|A mouse button was pressed|<span class="green-stable">stable</span>|
|MouseButtonReleased|A mouse button was released|<span class="green-stable">stable</span>|
|MouseButtonClicked|A click: the button was pressed and released by the same mouse button. Created by Guic, not by the system|<span class="green-stable">stable</span>|
|MouseWheelScrolled|The mouse wheel was scrolled|<span class="green-stable">stable</span>|
|WindowClosed|The window was closed|<span class="green-stable">stable</span>|
|WindowResized|The window was resized|<span class="green-stable">stable</span>|
|WindowMinimized|The window was minimized to the taskbar|<span class="green-stable">stable</span>|
|WindowMaximized|The window was maximized to full screen|<span class="green-stable">stable</span>|
|WindowRestored|The window was restored from the taskbar or made smaller|<span class="green-stable">stable</span>|
|WindowMoved|The window was moved|<span class="green-stable">stable</span>|
|WindowFocusGained|The window gained focus|<span class="green-stable">stable</span>|
|WindowFocusLost|The window lost focus|<span class="green-stable">stable</span>|
|TextEntered|Text was entered|<span class="green-stable">stable</span>|
|FileDropped|A file was dropped onto the window|<span class="green-stable">stable</span>|
|WindowExposed|Part of the window was damaged, covered, or shown again|<span class="green-stable">stable</span>|

## Nested structure mods

|Name|Purpose|Label|
|--------|----------|-----|
|shift|Any Shift key is held|<span class="green-stable">stable</span>|
|ctrl|Any Ctrl key is held|<span class="green-stable">stable</span>|
|alt|Any Alt key is held|<span class="green-stable">stable</span>|
|system|Any System key is held|<span class="green-stable">stable</span>|
|rshift|The right Shift key is held|<span class="green-stable">stable</span>|
|rctrl|The right Ctrl key is held|<span class="green-stable">stable</span>|
|ralt|The right Alt key is held|<span class="green-stable">stable</span>|
|rsystem|The right System key is held|<span class="green-stable">stable</span>|
|capslock|CapsLock is on|<span class="green-stable">stable</span>|
|numlock|NumLock is on|<span class="green-stable">stable</span>|
|scrolllock|ScrollLock is on|<span class="green-stable">stable</span>|

## The data union

A union with the event data. Which field is relevant depends on `type`:

* `key` - the `key` and the `repeat` flag. Guic does not currently fill the `pressed` and `released` flags
* `mouse` - the coordinates `x`, `y`, the offset `dx`, `dy`, the `key` and the wheel scroll `wheel`
* `click` - the press positions `pressedX`, `pressedY`, the release positions `releasedX`, `releasedY` and the `key`. Filled for `MouseButtonClicked`
* `window` - the position `x`, `y` and the size `w`, `h` of the window. Guic does not currently fill the `close` flag
* `text` - the entered text as a `char[32]` array
* `file` - the number of files `count`. Guic does not currently fill this field: the file paths are in `filePaths`
