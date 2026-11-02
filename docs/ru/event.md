# guic::Event
Структура описывает событие ввода и окна - тип события, модификаторы клавиш, идентификатор окна и данные события

## Поля

|Тип|Поле|Назначение|Метка|
|---|----|----------|-----|
|EventType|type|Тип события (по умолчанию `EventType::None`)|<span class="green-stable">stable</span>|
|mods|mods|Состояние модификаторов клавиш в момент события|<span class="green-stable">stable</span>|
|Uint32|winId|Идентификатор окна, в котором произошло событие (по умолчанию 0)|<span class="green-stable">stable</span>|
|Uint32|customId|Идентификатор пользовательского события. Диапазон 100000–999999 зарезервирован за Guic, 0–99999 - для основной разработки|<span class="green-stable">stable</span>|
|std::vector<std::string>|filePaths|Пути к файлам при событии перетаскивания файлов|<span class="green-stable">stable</span>|
|data|data|Данные события, содержимое зависит от `type`|<span class="green-stable">stable</span>|

## Перечисление Event::EventType

|Название|Назначение|Метка|
|--------|----------|-----|
|None|Отсутствие события или неудачное распознавание|<span class="green-stable">stable</span>|
|Custom|Пользовательское событие. Его идентификатор задаётся в `customId`|<span class="green-stable">stable</span>|
|KeyPressed|Клавиша нажата|<span class="green-stable">stable</span>|
|KeyReleased|Клавиша отпущена|<span class="green-stable">stable</span>|
|MouseMoved|Мышь двинулась|<span class="green-stable">stable</span>|
|MouseButtonPressed|Кнопка мыши нажата|<span class="green-stable">stable</span>|
|MouseButtonReleased|Кнопка мыши отпущена|<span class="green-stable">stable</span>|
|MouseButtonClicked|Клик: кнопка нажата и отпущена той же кнопкой мыши. Создаётся Guic, а не системой|<span class="green-stable">stable</span>|
|MouseWheelScrolled|Прокручено колёсико мыши|<span class="green-stable">stable</span>|
|WindowClosed|Окно закрыто|<span class="green-stable">stable</span>|
|WindowResized|Окно изменило размер|<span class="green-stable">stable</span>|
|WindowMinimized|Окно свернулось в панель|<span class="green-stable">stable</span>|
|WindowMaximized|Окно развернулось на весь экран|<span class="green-stable">stable</span>|
|WindowRestored|Окно восстановилось из панели или уменьшилось|<span class="green-stable">stable</span>|
|WindowMoved|Окно сдвинулось|<span class="green-stable">stable</span>|
|WindowFocusGained|Окно поймало фокус|<span class="green-stable">stable</span>|
|WindowFocusLost|Окно потеряло фокус|<span class="green-stable">stable</span>|
|TextEntered|Введён текст|<span class="green-stable">stable</span>|
|FileDropped|В окно закинут файл|<span class="green-stable">stable</span>|
|WindowExposed|Часть окна была повреждена, перекрыта или отображается снова|<span class="green-stable">stable</span>|

## Вложенная структура mods

|Название|Назначение|Метка|
|--------|----------|-----|
|shift|Зажата любая клавиша Shift|<span class="green-stable">stable</span>|
|ctrl|Зажата любая клавиша Ctrl|<span class="green-stable">stable</span>|
|alt|Зажата любая клавиша Alt|<span class="green-stable">stable</span>|
|system|Зажата любая клавиша System|<span class="green-stable">stable</span>|
|rshift|Зажата правая клавиша Shift|<span class="green-stable">stable</span>|
|rctrl|Зажата правая клавиша Ctrl|<span class="green-stable">stable</span>|
|ralt|Зажата правая клавиша Alt|<span class="green-stable">stable</span>|
|rsystem|Зажата правая клавиша System|<span class="green-stable">stable</span>|
|capslock|Включён CapsLock|<span class="green-stable">stable</span>|
|numlock|Включён NumLock|<span class="green-stable">stable</span>|
|scrolllock|Включён ScrollLock|<span class="green-stable">stable</span>|

## Объединение data

Объединение с данными события. Какое поле актуально, зависит от `type`:

* `key` - клавиша `key` и флаг `repeat`. Флаги `pressed` и `released` Guic сейчас не заполняет
* `mouse` - координаты `x`, `y`, смещение `dx`, `dy`, клавиша `key` и прокрутка `wheel`
* `click` - позиции нажатия `pressedX`, `pressedY`, позиции отпускания `releasedX`, `releasedY` и клавиша `key`. Заполняется для `MouseButtonClicked`
* `window` - позиция `x`, `y` и размер `w`, `h` окна. Флаг `close` Guic сейчас не заполняет
* `text` - введённый текст в виде массива `char[32]`
* `file` - количество файлов `count`. Guic сейчас не заполняет это поле: пути к файлам лежат в `filePaths`
