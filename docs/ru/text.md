# guic::Text
Класс является представлением текста - выводит строку заданным шрифтом и цветом

## Конструкторы

* `Text()` - Базовый конструктор для создания текста <span class="yellow-stable">beta</span>
* `Text(Rect rect)` - Конструктор для создания текста с заданным прямоугольником <span class="yellow-stable">beta</span>
* `Text(Rect rect, const std::string& str)` - Конструктор для создания текста с заданными прямоугольником и строкой <span class="yellow-stable">beta</span>
* `Text(Rect rect, const std::string& str, Font& font)` - Конструктор для создания текста с заданными прямоугольником, строкой и шрифтом <span class="yellow-stable">beta</span>

## Публичные методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|setString|Устанавливает строку текста|<span class="green-stable">stable</span>|
|void|setFont|Устанавливает шрифт текста|<span class="green-stable">stable</span>|
|void|setColor|Устанавливает цвет текста|<span class="green-stable">stable</span>|
|std::string|getString|Возвращает строку текста|<span class="green-stable">stable</span>|
|const Font*|getFont|Возвращает шрифт текста|<span class="green-stable">stable</span>|
|Color|getColor|Возвращает цвет текста|<span class="green-stable">stable</span>|
|void|preload|Подготавливает ресурсы текста для рендерера|<span class="yellow-stable">beta</span>|
|void|draw|Рисует текст через рендерер|<span class="yellow-stable">beta</span>|

## Защищённые методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|buildGeometry|Строит геометрию текста|<span class="red-stable">unstable</span>|
|std::vector<engine::Vertex>|textGeometry|Вершины геометрии текста (поле)|<span class="red-stable">unstable</span>|

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
|Element*|hit|Возвращает элемент, попавший в точку (x, y) (виртуальный)|<span class="yellow-stable">beta</span>|
|void|attachTo|Прикрепляет элемент к родителю|<span class="red-stable">unstable</span>|
|void|detach|Отсоединяет элемент от родителя|<span class="red-stable">unstable</span>|
|void|detachChild|Отсоединяет дочерний элемент (виртуальный)|<span class="red-stable">unstable</span>|

## Унаследованные методы : protected Element

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|unchange|Сбрасывает признак изменения и `oldRect` после отрисовки|<span class="yellow-stable">beta</span>|
|Rect|rect|Прямоугольник элемента (поле)|<span class="red-stable">unstable</span>|
|Rect|oldRect|Прямоугольник элемента до первого изменения (поле)|<span class="red-stable">unstable</span>|
