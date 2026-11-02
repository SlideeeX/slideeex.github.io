# guic::Sprite
Класс является представлением спрайта - прямоугольника, залитого цветом или изображением, с возможностью скругления углов

## Конструкторы

* `Sprite()` - Базовый конструктор для создания спрайта
* `Sprite(Rect rect)` - Конструктор для создания спрайта с заданным прямоугольником
* `Sprite(Rect rect, Image& image)` - Конструктор для создания спрайта с заданным прямоугольником и изображением
* `Sprite(Rect rect, Color color)` - Конструктор для создания спрайта с заданным прямоугольником и цветом

## Перечисление Mode - режимы заливки спрайта

|Название|Назначение|Метка|
|--------|----------|-----|
|Color|Заливка цветом|<span class="green-stable">stable</span>|
|Image|Заливка изображением без окраски: цвет спрайта на изображение не влияет|<span class="green-stable">stable</span>|
|Mashup|Заливка изображением, окрашенным цветом спрайта. Режим сохраняется при вызовах `setImage` и `setColor`|<span class="green-stable">stable</span>|

## Публичные методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|setImage|Устанавливает изображение спрайта и переводит спрайт в режим `Image`. В режиме `Mashup` режим не меняется|<span class="green-stable">stable</span>|
|const Image*|getImage|Возвращает изображение спрайта|<span class="green-stable">stable</span>|
|void|setImageRect|Устанавливает область изображения, которая будет показана|<span class="green-stable">stable</span>|
|void|setColor|Устанавливает цвет спрайта и переводит спрайт в режим `Color`. В режиме `Mashup` режим не меняется, а цвет окрашивает изображение|<span class="green-stable">stable</span>|
|Color|getColor|Возвращает цвет спрайта|<span class="green-stable">stable</span>|
|void|setRadius|Устанавливает радиус скругления углов|<span class="green-stable">stable</span>|
|int|getRadius|Возвращает радиус скругления углов|<span class="green-stable">stable</span>|
|void|setMode|Устанавливает режим заливки|<span class="green-stable">stable</span>|
|Mode|getMode|Возвращает режим заливки|<span class="green-stable">stable</span>|
|void|preload|Подготавливает ресурсы спрайта для рендерера|<span class="yellow-stable">beta</span>|
|void|draw|Рисует спрайт через рендерер|<span class="green-stable">stable</span>|
|Element*|hit|Возвращает элемент, попавший в точку (x, y)|<span class="green-stable">stable</span>|

## Защищённые методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|std::vector<engine::Vertex>|geometry|Вершины геометрии спрайта (поле)|<span class="green-stable">stable</span>|
|void|buildGeometry|Строит геометрию спрайта|<span class="green-stable">stable</span>|
|void|buildRoundedGeometry|Строит геометрию спрайта со скруглёнными углами|<span class="green-stable">stable</span>|
|Rect|imageRect|Область изображения, которая будет показана (поле)|<span class="yellow-stable">beta</span>|
|bool|calculateImageRect|Нужно ли пересчитать `imageRect` (поле, по умолчанию `true`)|<span class="yellow-stable">beta</span>|
|static constexpr int|cornerSegments|Количество сегментов на одно скругление угла (поле, `4`)|<span class="red-stable">unstable</span>|
|static constexpr float|arcTolerance|Допуск аппроксимации дуги скругления (поле, `0.2f`)|<span class="red-stable">unstable</span>|

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
|void|control|Обрабатывает событие `Event` (виртуальный)|<span class="green-stable">stable</span>|
|void|attachTo|Прикрепляет элемент к родителю|<span class="red-stable">unstable</span>|
|void|detach|Отсоединяет элемент от родителя|<span class="red-stable">unstable</span>|
|void|detachChild|Отсоединяет дочерний элемент (виртуальный)|<span class="red-stable">unstable</span>|

## Унаследованные методы : protected Element

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|unchange|Сбрасывает признак изменения и `oldRect` после отрисовки|<span class="green-stable">stable</span>|
|Rect|rect|Прямоугольник элемента (поле)|<span class="green-stable">stable</span>|
|Rect|oldRect|Прямоугольник элемента до первого изменения (поле)|<span class="green-stable">stable</span>|
