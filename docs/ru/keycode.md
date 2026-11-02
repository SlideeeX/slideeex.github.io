# guic::engine::KeyCode
Перечисление физических кодов клавиш и кнопок (`enum class KeyCode : Uint16`). Значения сгруппированы, полный список с номерами - в `engine/KeyCode.hpp`. Обычно не используется напрямую: для работы с клавишами применяются константы из [Key](key.md) и тип [Keys](keys.md). <span class="yellow-stable">beta</span>

## Группы значений

* `Unknown` - неизвестная клавиша (значение 0)
* Буквы `A`-`Z`, цифры `D0`-`D9` основной клавиатуры
* Служебные клавиши: `Return`, `Escape`, `Backspace`, `Tab`, `Space`, `CapsLock`, знаки пунктуации (`Minus`, `Equals`, `Comma`, `Period`, `Slash` и другие)
* Клавиши `Shift`, `Ctrl`, `Alt`, `GUI` и их правые варианты `RShift`, `RCtrl`, `RAlt`, `RGUI`
* Функциональные клавиши `F1`-`F24`
* Навигация: `Insert`, `Delete`, `Home`, `End`, `PageUp`, `PageDown`, стрелки `Up`, `Down`, `Left`, `Right`
* Цифровая клавиатура: `NumLock`, `Num0`-`Num9`, `NumEnter`, `NumPlus`, `NumMinus`, `NumMultiply`, `NumDivide`, `NumPeriod`, `NumEquals`, а также клавиши `KP_*` (память калькулятора, шестнадцатеричные и другие)
* Мультимедиа и системные: `Mute`, `VolumeUp`, `VolumeDown`, `Power`, `Sleep`, `Menu`, `Find`, `Copy`, `Paste`, `Cut`, `Undo`, `AC_*` (браузерные клавиши)
* Языковые клавиши: `International1`-`International9`, `LANG1`-`LANG9`
* Кнопки мыши: `LeftMouseButton`, `MiddleMouseButton`, `RightMouseButton`, `SideMouseButtonX1`, `SideMouseButtonX2`
* Кнопки контроллера: `ControllerButton*` (A, B, X, Y, Start, Back, стики, плечевые кнопки, D-pad и другие)
* `Reserved` (значение 400) - зарезервировано, `Count` (значение 512) - количество значений
