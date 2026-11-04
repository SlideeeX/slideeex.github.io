# guic::Container
Класс является элементом-контейнером - хранит дочерние элементы и передаёт им события и отрисовку. Добавляемые элементы привязываются к Container, поэтому действует строгая иерархия - любой элемент предназначен только для одного родителя.

## Конструкторы

* `Container()` - Базовый конструктор для создания контейнера <span class="yellow-stable">beta</span>
* `Container(Rect rect)` - Конструктор для создания контейнера с заданным прямоугольником <span class="yellow-stable">beta</span>

## Публичные методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|add|Добавляет дочерний элемент|<span class="green-stable">stable</span>|
|void|remove|Удаляет дочерний элемент|<span class="green-stable">stable</span>|
|void|clear|Удаляет все дочерние элементы|<span class="green-stable">stable</span>|
|void|detachChild|Отсоединяет дочерний элемент `child` (принимает `const Element*`)|<span class="red-stable">unstable</span>|
|void|setRect|Устанавливает позицию и размер контейнера|<span class="red-stable">unstable</span>|
|void|setPosition|Устанавливает позицию контейнера|<span class="green-stable">stable</span>|
|void|setSize|Устанавливает размер контейнера|<span class="green-stable">stable</span>|
|Rect|collectDirtyRect|Возвращает область, которую нужно перерисовать|<span class="red-stable">unstable</span>|
|void|control|Передаёт событие дочерним элементам|<span class="green-stable">stable</span>|
|void|preload|Подготавливает ресурсы дочерних элементов для рендерера|<span class="yellow-stable">beta</span>|
|void|draw|Рисует дочерние элементы через рендерер|<span class="yellow-stable">beta</span>|
|Element*|hit|Возвращает верхний дочерний элемент, попавший в точку (x, y), или `nullptr`|<span class="yellow-stable">beta</span>|

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
|Position|getPosition|Возвращает позицию элемента|<span class="green-stable">stable</span>|
|Size|getSize|Возвращает размер элемента|<span class="green-stable">stable</span>|
|Rect|getRect|Возвращает прямоугольник элемента|<span class="red-stable">unstable</span>|
|Rect|getGlobalRect|Возвращает прямоугольник элемента в глобальных координатах|<span class="red-stable">unstable</span>|
|Rect|getVisibleRect|Возвращает видимую часть прямоугольника элемента|<span class="red-stable">unstable</span>|
|Rect|getGlobalVisibleRect|Возвращает видимую часть прямоугольника в глобальных координатах|<span class="red-stable">unstable</span>|
|const Element*|getParent|Возвращает родительский элемент|<span class="yellow-stable">beta</span>|
|void|attachTo|Прикрепляет элемент к родителю|<span class="red-stable">unstable</span>|
|void|detach|Отсоединяет элемент от родителя|<span class="red-stable">unstable</span>|

## Унаследованные методы : protected Element

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|unchange|Сбрасывает признак изменения и `oldRect` после отрисовки|<span class="yellow-stable">beta</span>|
|Rect|rect|Прямоугольник элемента (поле)|<span class="red-stable">unstable</span>|
|Rect|oldRect|Прямоугольник элемента до первого изменения (поле)|<span class="red-stable">unstable</span>|
