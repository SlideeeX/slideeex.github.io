# guic::engine::EngineWindow
Класс является низкоуровневым окном платформы - создаёт нативное окно и владеет рендерером. `Window` работает через него

## Конструкторы

* `EngineWindow()` - Базовый конструктор для создания окна
* `EngineWindow(std::string name, Size size)` - Конструктор для создания окна с заданными названием и размером
* `EngineWindow(const EngineWindow&)` - Копирование запрещено
* `EngineWindow& operator=(const EngineWindow&)` - Присваивание запрещено

## Методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|open|Открывает окно|<span class="green-stable">stable</span>|
|void|close|Закрывает окно|<span class="green-stable">stable</span>|
|void|show|Показывает окно|<span class="green-stable">stable</span>|
|void|hide|Скрывает окно|<span class="green-stable">stable</span>|
|void|focus|Переводит фокус на окно|<span class="green-stable">stable</span>|
|void|setSize|Устанавливает размер окна|<span class="green-stable">stable</span>|
|void|setName|Устанавливает название окна|<span class="green-stable">stable</span>|
|void|display|Выводит содержимое окна на экран|<span class="green-stable">stable</span>|
|void|setClipRect|Устанавливает область отсечения для рисования|<span class="green-stable">stable</span>|
|void|load|Загружает ресурс в рендерер окна|<span class="green-stable">stable</span>|
|void|unload|Выгружает ресурс из рендерера окна|<span class="green-stable">stable</span>|
|bool|isOpen|Проверяет, открыто ли окно|<span class="green-stable">stable</span>|
|bool|isShow|Проверяет, отображается ли окно|<span class="green-stable">stable</span>|
|bool|isFocused|Проверяет, есть ли у окна фокус|<span class="green-stable">stable</span>|
|Uint32|getId|Возвращает идентификатор окна|<span class="green-stable">stable</span>|
|Renderer*|getRenderer|Возвращает рендерер окна|<span class="green-stable">stable</span>|
|Size|getSize|Возвращает размер окна|<span class="green-stable">stable</span>|
|std::string|getName|Возвращает название окна|<span class="green-stable">stable</span>|
