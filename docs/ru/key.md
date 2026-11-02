# guic::engine::key
Пространство имён с готовыми константами клавиш типа [Keys](keys.md). Константы созданы функцией `makeKey(KeyCode)` из значений [KeyCode](keycode.md). Полный список - в `engine/Key.hpp`.

## Namespace guic::engine::key::Key

Основные константы, сгруппированные так же, как значения `KeyCode`:

* `Unknown` - неизвестная клавиша <span class="green-stable">stable</span>
* Буквы: `A`-`Z` <span class="green-stable">stable</span>
* Цифры основной клавиатуры: `D0`-`D9` <span class="green-stable">stable</span>
* Служебные и знаки: `Return`, `Escape`, `Backspace`, `Tab`, `Space`, `CapsLock`, `Minus`, `Equals`, `Comma`, `Period`, `Slash` и другие <span class="green-stable">stable</span>
* Модификаторы: `Shift`, `Ctrl`, `Alt`, `GUI`, `RShift`, `RCtrl`, `RAlt`, `RGUI` <span class="green-stable">stable</span>
* Функциональные клавиши: `F1`-`F24` <span class="green-stable">stable</span>
* Навигация: `Insert`, `Delete`, `Home`, `End`, `PageUp`, `PageDown`, `Up`, `Down`, `Left`, `Right` <span class="green-stable">stable</span>
* Цифровая клавиатура: `NumLock`, `Num0`-`Num9`, `NumEnter`, `NumPlus`, `NumMinus` и другие <span class="green-stable">stable</span>
* Мультимедиа и системные: `Mute`, `VolumeUp`, `VolumeDown`, `Power`, `Sleep`, `AC_*`<span class="yellow-stable">beta</span>
* Языковые: `International1`-`International9`, `LANG1`-`LANG9` <span class="yellow-stable">beta</span>
* Мышь: `LMB`, `MMB`, `RMB`, `SideMouseButtonX1`, `SideMouseButtonX2` <span class="green-stable">stable</span>
* Контроллер: `ControllerButton*` <span class="yellow-stable">beta</span>

## Namespace guic::engine::key::Key::Mouse

Псевдонимы кнопок мыши: `LeftMouseButton`, `MiddleMouseButton`, `RightMouseButton`, `SideMouseButtonX1`, `SideMouseButtonX2`. <span class="green-stable">stable</span>

## Namespace guic::engine::key::Key::Keyboard

Псевдонимы клавиш клавиатуры без префикса `Key::`: буквы `A`-`Z`, цифры `D0`-`D9`, `Escape`, `Tab`, `CapsLock`, модификаторы, знаки, `PrintScreen`, `ScrollLock`, `Pause`, навигация, стрелки, `F1`-`F12`, цифровая клавиатура (`NumLock`, `Num0`-`Num9`, `NumEnter` и другие). <span class="green-stable">stable</span>
