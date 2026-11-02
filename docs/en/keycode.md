# guic::engine::KeyCode
An enumeration of physical key and button codes (`enum class KeyCode : Uint16`). The values are grouped; the full list with numbers is in `engine/KeyCode.hpp`. Usually not used directly: for working with keys, the constants from [Key](key.md) and the type [Keys](keys.md) are used. <span class="yellow-stable">beta</span>

## Value groups

* `Unknown` - unknown key (value 0)
* Letters `A`-`Z`, digits `D0`-`D9` of the main keyboard
* Service keys: `Return`, `Escape`, `Backspace`, `Tab`, `Space`, `CapsLock`, punctuation signs (`Minus`, `Equals`, `Comma`, `Period`, `Slash` and others)
* Keys `Shift`, `Ctrl`, `Alt`, `GUI` and their right-hand variants `RShift`, `RCtrl`, `RAlt`, `RGUI`
* Function keys `F1`-`F24`
* Navigation: `Insert`, `Delete`, `Home`, `End`, `PageUp`, `PageDown`, arrows `Up`, `Down`, `Left`, `Right`
* Numeric keypad: `NumLock`, `Num0`-`Num9`, `NumEnter`, `NumPlus`, `NumMinus`, `NumMultiply`, `NumDivide`, `NumPeriod`, `NumEquals`, as well as `KP_*` keys (calculator memory, hexadecimal and others)
* Multimedia and system: `Mute`, `VolumeUp`, `VolumeDown`, `Power`, `Sleep`, `Menu`, `Find`, `Copy`, `Paste`, `Cut`, `Undo`, `AC_*` (browser keys)
* Language keys: `International1`-`International9`, `LANG1`-`LANG9`
* Mouse buttons: `LeftMouseButton`, `MiddleMouseButton`, `RightMouseButton`, `SideMouseButtonX1`, `SideMouseButtonX2`
* Controller buttons: `ControllerButton*` (A, B, X, Y, Start, Back, sticks, shoulder buttons, D-pad and others)
* `Reserved` (value 400) - reserved, `Count` (value 512) - the number of values
