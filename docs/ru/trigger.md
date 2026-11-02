# guic::Trigger
Класс является обработчиком событий - выполняет колбэк при выполнении условия или при нажатии клавиш и кнопок мыши

## Конструкторы

* `Trigger()` - Базовый конструктор для создания триггера
* `Trigger(Rect rect)` - Конструктор для создания триггера с заданным прямоугольником

## Публичные методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|on|Задаёт условие срабатывания без аргументов (`std::function<bool()>`)|<span class="green-stable">stable</span>|
|void|on|Задаёт условие срабатывания по событию (`std::function<bool(const Event*)>`)|<span class="green-stable">stable</span>|
|void|bind|Задаёт колбэк без аргументов (`std::function<void()>`)|<span class="green-stable">stable</span>|
|void|bind|Задаёт колбэк с событием (`std::function<void(const Event*)>`)|<span class="green-stable">stable</span>|
|void|onKey|Задаёт коллбэк на нажатие клавиши `keys` (срабатывает только на `KeyPressed`). Модификаторы Shift, Ctrl, Alt, GUI, входящие в `keys`, должны быть зажаты. Если модификаторов в `keys` нет, зажатые модификаторы не допускаются (CapsLock, NumLock и ScrollLock не учитываются)|<span class="green-stable">stable</span>|
|void|onKeys|Задаёт колбэк на нажатие любой из перечисленных клавиш `keys` (Сочетания не поддерживаются)|<span class="green-stable">stable</span>|
|void|onLMB|Задаёт колбэк на клик левой кнопкой мыши (нажатие и отпускание произошли над одним элементом)|<span class="green-stable">stable</span>|
|void|onRMB|Задаёт колбэк на отпускание правой кнопки мыши|<span class="green-stable">stable</span>|
|void|onHover|Задаёт колбэк `std::function<void(bool hovered)>`, который вызывается при изменении состояния наведения курсора на триггер (с учётом радиуса)|<span class="green-stable">stable</span>|
|void|control|Обрабатывает событие и вызывает колбэк, если условие выполнено|<span class="green-stable">stable</span>|
|void|setRadius|Задаёт радиус скругления области срабатывания (отрицательные значения приравниваются к 0)|<span class="green-stable">stable</span>|
|int|getRadius|Возвращает радиус скругления области срабатывания|<span class="green-stable">stable</span>|
|Element*|hit|Возвращает триггер, если точка (x, y) попадает в его область с учётом радиуса, иначе `nullptr`. При радиусе 0 работает как базовый `Element::hit`|<span class="green-stable">stable</span>|
|Rect|collectDirtyRect|Всегда возвращает пустой прямоугольник (триггер не требует перерисовки)|<span class="green-stable">stable</span>|

## Защищённые методы

Защищённых методов и полей нет.

## Унаследованные методы : public Element

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|bool|isShow|Проверяет, отображается ли элемент|<span class="green-stable">stable</span>|
|bool|isChanged|Проверяет, менялся ли элемент с последней отрисовки|<span class="green-stable">stable</span>|
|void|show|Делает элемент видимым|<span class="green-stable">stable</span>|
|void|hide|Скрывает элемент|<span class="green-stable">stable</span>|
|void|update|Помечает элемент для обновления|<span class="green-stable">stable</span>|
|void|setLayer|Устанавливает слой элемента|<span class="green-stable">stable</span>|
|Uint16|getLayer|Возвращает слой элемента|<span class="green-stable">stable</span>|
|void|setHit|Включает или выключает реакцию элемента на попадание курсора|<span class="green-stable">stable</span>|
|bool|isHit|Проверяет, реагирует ли элемент на попадание курсора|<span class="green-stable">stable</span>|
|void|setPosition|Устанавливает позицию элемента (виртуальный)|<span class="green-stable">stable</span>|
|void|setSize|Устанавливает размер элемента (виртуальный)|<span class="green-stable">stable</span>|
|void|setRect|Устанавливает позицию и размер элемента (виртуальный)|<span class="green-stable">stable</span>|
|Position|getPosition|Возвращает позицию элемента|<span class="green-stable">stable</span>|
|Size|getSize|Возвращает размер элемента|<span class="green-stable">stable</span>|
|Rect|getRect|Возвращает прямоугольник элемента|<span class="green-stable">stable</span>|
|Rect|getGlobalRect|Возвращает прямоугольник элемента в глобальных координатах|<span class="green-stable">stable</span>|
|Rect|getVisibleRect|Возвращает видимую часть прямоугольника элемента|<span class="green-stable">stable</span>|
|Rect|getGlobalVisibleRect|Возвращает видимую часть прямоугольника в глобальных координатах|<span class="green-stable">stable</span>|
|Rect|collectDirtyRect|Возвращает область, которую нужно перерисовать (виртуальный)|<span class="green-stable">stable</span>|
|const Element*|getParent|Возвращает родительский элемент|<span class="yellow-stable">beta</span>|
|void|preload|Подготавливает ресурсы элемента для рендерера (виртуальный)|<span class="yellow-stable">beta</span>|
|void|draw|Рисует элемент через рендерер (виртуальный)|<span class="green-stable">stable</span>|
|Element*|hit|Возвращает элемент, попавший в точку (x, y) (виртуальный)|<span class="green-stable">stable</span>|
|void|attachTo|Прикрепляет элемент к родителю|<span class="red-stable">unstable</span>|
|void|detach|Отсоединяет элемент от родителя|<span class="red-stable">unstable</span>|
|void|detachChild|Отсоединяет дочерний элемент (виртуальный)|<span class="red-stable">unstable</span>|

## Унаследованные методы : protected Element

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|unchange|Сбрасывает признак изменения и `oldRect` после отрисовки|<span class="green-stable">stable</span>|
|Rect|rect|Прямоугольник элемента (поле)|<span class="green-stable">stable</span>|
|Rect|oldRect|Прямоугольник элемента до первого изменения (поле)|<span class="green-stable">stable</span>|
