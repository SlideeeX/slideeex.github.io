# guic::Composite
Класс является интерфейсом для создания составных элементов - объединяет элементы в один объект для ручного (adobt/release) или автоматического (add/remove) управления

## Конструкторы

* `Composite()` - Базовый конструктор для создания составного элемента <span class="yellow-stable">beta</span>
* `Composite(Rect rect)` - Конструктор для создания составного элемента с заданным прямоугольником <span class="yellow-stable">beta</span>
* `~Composite()` - Отсоединяет и удаляет внутренний контейнер <span class="green-stable">stable</span>

## Публичные методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|setRect|Устанавливает позицию и размер элемента|<span class="red-stable">unstable</span>|
|void|setPosition|Устанавливает позицию элемента|<span class="green-stable">stable</span>|
|void|setSize|Устанавливает размер элемента|<span class="green-stable">stable</span>|
|void|draw|Рисует составной элемент через рендерер|<span class="yellow-stable">beta</span>|
|void|control|Обрабатывает событие|<span class="green-stable">stable</span>|
|void|preload|Подготавливает ресурсы для рендерера|<span class="yellow-stable">beta</span>|
|Element*|hit|Возвращает элемент, попавший в точку (x, y)|<span class="yellow-stable">beta</span>|
|Rect|collectDirtyRect|Возвращает область, которую нужно перерисовать|<span class="red-stable">unstable</span>|

## Защищённые методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|add|Добавляет элемент во внутренний контейнер|<span class="green-stable">stable</span>|
|void|remove|Удаляет элемент из внутреннего контейнера|<span class="green-stable">stable</span>|
|void|adopt|Привязывает элемент к композиту (`attachTo`)|<span class="yellow-stable">beta</span>|
|void|release|Отвязывает элемент от композита (`detach`)|<span class="yellow-stable">beta</span>|
|void|detachChild|Отсоединяет дочерний элемент `child` (принимает `const Element*`) через внутренний контейнер|<span class="red-stable">unstable</span>|

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
