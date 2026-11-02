# guic::Window
Класс является представлением окна - создаёт окно, управляет его состоянием и содержит элементы

## Конструкторы

* `Window()` - Базовый конструктор для создания окна. Инициализирует Guic, если это ещё не сделано
* `Window(std::string name, Size size)` - Конструктор для создания окна с заданными названием и размером
* `Window(const Window&)` - Копирование запрещено
* `Window& operator=(const Window&)` - Присваивание запрещено

## Деструктор

* `~Window()` - Удаляет окно из списка окон Guic. Если окон не осталось, вызывает `config::guic_quit()` <span class="green-stable">stable</span>

## Методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|tune|Настраивает окно - забирает события из очереди Guic, передаёт их окнам и запускает обработку элементов (см. ниже)|<span class="green-stable">stable</span>|
|void|display|Строит геометрию элементов, выводит содержимое окна на экран с учётом локального FPS и загрязнённых областей|<span class="green-stable">stable</span>|
|void|setFPS|Устанавливает частоту кадров окна. По умолчанию 60, значение 0 снимает ограничение|<span class="green-stable">stable</span>|
|void|redrawNextFrame|Требует перерисовки на следующем кадре|<span class="green-stable">stable</span>|
|void|open|Открывает окно и показывает его|<span class="green-stable">stable</span>|
|void|close|Закрывает окно, очищает его события и перестаёт обрабатывать события|<span class="green-stable">stable</span>|
|void|closeEventSkip|Отключает автоматическое закрытие окна при событии `WindowClosed`. Флаг нельзя сбросить: после вызова окно не закрывается само, и приложение должно закрывать его сам|<span class="green-stable">stable</span>|
|void|show|Показывает окно|<span class="green-stable">stable</span>|
|void|hide|Скрывает окно, обработка событий продолжается фоново|<span class="green-stable">stable</span>|
|void|focus|Запрашивает установку фокуса на окно|<span class="green-stable">stable</span>|
|void|setSize|Устанавливает размер окна|<span class="green-stable">stable</span>|
|void|setName|Устанавливает название окна|<span class="green-stable">stable</span>|
|void|load|Добавляет для этого окна ресурс в очередь на загрузку в рендерер|<span class="green-stable">stable</span>|
|void|unload|Добавляет для этого окна ресурс в очередь на выгрузку из рендерера. Выгрузка выполняется при следующем `flush()` рендерера|<span class="green-stable">stable</span>|
|void|pushEvent|Добавляет событие в очередь событий окна. Событие принимается, только если окно открыто и показано|<span class="green-stable">stable</span>|
|void|clearEvents|Очищает очередь событий окна|<span class="green-stable">stable</span>|
|void|add|Добавляет элемент в окно|<span class="green-stable">stable</span>|
|void|remove|Удаляет элемент из окна|<span class="green-stable">stable</span>|
|void|clear|Удаляет все элементы из окна|<span class="green-stable">stable</span>|
|bool|isOpen|Проверяет, открыто ли окно|<span class="green-stable">stable</span>|
|bool|isShow|Проверяет, отображается ли окно|<span class="green-stable">stable</span>|
|bool|isFocused|Проверяет, сфокусирована ли система сейчас на окне|<span class="green-stable">stable</span>|
|Uint32|getId|Возвращает идентификатор окна|<span class="green-stable">stable</span>|
|engine::Renderer*|getRenderer|Возвращает рендерер окна|<span class="green-stable">stable</span>|
|Size|getSize|Возвращает размер окна|<span class="green-stable">stable</span>|
|std::string|getName|Возвращает название окна|<span class="green-stable">stable</span>|
|std::vector<const Event*>|getEvents|Возвращает копию списка указателей на события окна|<span class="green-stable">beta</span>|

## Маршрутизация событий в tune()

* События из очереди Guic передаются окну с совпадающим `winId`. Событие с `winId` 0 передаётся всем окнам.
* Событие `WindowResized` меняет размер корневого контейнера окна.
* `MouseMoved` передаётся элементу под курсором. Окно запоминает этот элемент как последний, с которым работал курсор.
* Остальные события мыши (нажатия, отпускания, колесо) передаются элементу под курсором.
* `MouseButtonClicked` передаётся элементу, только если нажатие и отпускание произошли над одним и тем же элементом.
* Остальные события передаются корневому контейнеру окна через `control`.
* `WindowClosed` закрывает окно, если не был вызван `closeEventSkip()`.

Свободные функции обработки очереди событий (`guic_send_event`, `config::guic_update_events`, `config::guic_poll_event`) описаны в [Функциях](functions.md).
