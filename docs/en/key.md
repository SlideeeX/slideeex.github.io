# guic::engine::key
A namespace with ready-made key constants of the [Keys](keys.md) type. The constants are created by the function `makeKey(KeyCode)` from the values of [KeyCode](keycode.md). The full list is in `engine/Key.hpp`.

## Namespace guic::engine::key::Key

Main constants, grouped the same way as the `KeyCode` values:

* `Unknown` - unknown key <span class="green-stable">stable</span>
* Letters: `A`-`Z` <span class="green-stable">stable</span>
* Digits of the main keyboard: `D0`-`D9` <span class="green-stable">stable</span>
* Service and punctuation keys: `Return`, `Escape`, `Backspace`, `Tab`, `Space`, `CapsLock`, `Minus`, `Equals`, `Comma`, `Period`, `Slash` and others <span class="green-stable">stable</span>
* Modifiers: `Shift`, `Ctrl`, `Alt`, `GUI`, `RShift`, `RCtrl`, `RAlt`, `RGUI` <span class="green-stable">stable</span>
* Function keys: `F1`-`F24` <span class="green-stable">stable</span>
* Navigation: `Insert`, `Delete`, `Home`, `End`, `PageUp`, `PageDown`, `Up`, `Down`, `Left`, `Right` <span class="green-stable">stable</span>
* Numeric keypad: `NumLock`, `Num0`-`Num9`, `NumEnter`, `NumPlus`, `NumMinus` and others <span class="green-stable">stable</span>
* Multimedia and system: `Mute`, `VolumeUp`, `VolumeDown`, `Power`, `Sleep`, `AC_*`<span class="yellow-stable">beta</span>
* Language keys: `International1`-`International9`, `LANG1`-`LANG9` <span class="yellow-stable">beta</span>
* Mouse: `LMB`, `MMB`, `RMB`, `SideMouseButtonX1`, `SideMouseButtonX2` <span class="green-stable">stable</span>
* Controller: `ControllerButton*` <span class="yellow-stable">beta</span>

## Namespace guic::engine::key::Key::Mouse

Mouse button aliases: `LeftMouseButton`, `MiddleMouseButton`, `RightMouseButton`, `SideMouseButtonX1`, `SideMouseButtonX2`. <span class="green-stable">stable</span>

## Namespace guic::engine::key::Key::Keyboard

Keyboard key aliases without the `Key::` prefix: letters `A`-`Z`, digits `D0`-`D9`, `Escape`, `Tab`, `CapsLock`, modifiers, signs, `PrintScreen`, `ScrollLock`, `Pause`, navigation, arrows, `F1`-`F12`, the numeric keypad (`NumLock`, `Num0`-`Num9`, `NumEnter` and others). <span class="green-stable">stable</span>
