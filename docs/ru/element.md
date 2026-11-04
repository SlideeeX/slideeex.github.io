# guic::Element
Базовый класс всех графических элементов - хранит позицию, размер, слой, видимость и родителя

## Конструкторы

* `Element()` - Базовый конструктор элемента <span class="yellow-stable">beta</span>
* `Element(const Element&)` - Копирование запрещено <span class="yellow-stable">beta</span>
* `Element& operator=(const Element&)` - Присваивание запрещено

## Публичные методы

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
|void|setRect|Устанавливает позицию и размер элемента (виртуальный)|<span class="red-stable">unstable</span>|
|Position|getPosition|Возвращает позицию элемента|<span class="green-stable">stable</span>|
|Size|getSize|Возвращает размер элемента|<span class="green-stable">stable</span>|
|Rect|getRect|Возвращает прямоугольник элемента|<span class="red-stable">unstable</span>|
|Rect|getGlobalRect|Возвращает прямоугольник элемента в глобальных координатах|<span class="red-stable">unstable</span>|
|Rect|getVisibleRect|Возвращает видимую часть прямоугольника элемента|<span class="red-stable">unstable</span>|
|Rect|getGlobalVisibleRect|Возвращает видимую часть прямоугольника в глобальных координатах|<span class="red-stable">unstable</span>|
|Rect|collectDirtyRect|Возвращает область, которую нужно перерисовать (виртуальный)|<span class="red-stable">unstable</span>|
|const Element*|getParent|Возвращает родительский элемент|<span class="yellow-stable">beta</span>|
|void|control|Обрабатывает событие `Event` (виртуальный)|<span class="green-stable">stable</span>|
|void|preload|Подготавливает ресурсы элемента для рендерера (виртуальный)|<span class="yellow-stable">beta</span>|
|void|draw|Рисует элемент через рендерер (виртуальный)|<span class="yellow-stable">beta</span>|
|Element*|hit|Возвращает элемент, попавший в точку (x, y) (виртуальный)|<span class="yellow-stable">beta</span>|
|void|attachTo|Прикрепляет элемент к родителю|<span class="red-stable">unstable</span>|
|void|detach|Отсоединяет элемент от родителя|<span class="red-stable">unstable</span>|
|void|detachChild|Отсоединяет дочерний элемент `child` типа `const Element*` (виртуальный)|<span class="red-stable">unstable</span>|

## Защищённые методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|unchange|Сбрасывает признак изменения и `oldRect` после отрисовки|<span class="yellow-stable">beta</span>|
|Rect|rect|Прямоугольник элемента (поле)|<span class="red-stable">unstable</span>|
|Rect|oldRect|Прямоугольник элемента до первого изменения (поле)|<span class="red-stable">unstable</span>|
