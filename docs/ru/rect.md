# guic::Rect
Класс является представлением прямоугольника - хранит позицию левого верхнего угла, ширину и высоту

## Конструкторы

* `Rect()` - Базовый конструктор для создания пустого прямоугольника
* `Rect(int x, int y, int width, int height)` - Конструктор для создания прямоугольника с заданными позицией, шириной и высотой

## Поля

|Тип|Поле|Назначение|Метка|
|---|----|----------|-----|
|int|x|Координата левого края (по умолчанию 0)|<span class="green-stable">stable</span>|
|int|y|Координата верхнего края (по умолчанию 0)|<span class="green-stable">stable</span>|
|int|width|Ширина (по умолчанию 0)|<span class="green-stable">stable</span>|
|int|height|Высота (по умолчанию 0)|<span class="green-stable">stable</span>|

## Методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|bool|isEmpty|Проверяет, является ли прямоугольник пустым|<span class="green-stable">stable</span>|
|bool|contains|Проверяет, находится ли точка (x, y) внутри прямоугольника|<span class="green-stable">stable</span>|
|bool|contains(x, y, radius)|Проверяет, находится ли точка (x, y) внутри прямоугольника со скруглёнными углами радиуса `radius`. Радиус ограничивается половиной ширины и высоты|<span class="green-stable">stable</span>|
|bool|intersects|Проверяет, пересекается ли прямоугольник с другим прямоугольником|<span class="green-stable">stable</span>|
|Rect|getClippedArea|Возвращает область пересечения с другим прямоугольником|<span class="green-stable">stable</span>|
|Rect|getMerged|Возвращает прямоугольник, объединяющий данный и другой прямоугольник|<span class="green-stable">stable</span>|
|bool|operator==|Сравнение координат и размеров с другим прямоугольником|<span class="green-stable">stable</span>|
|bool|operator!=|Сравнение "НЕ" координат и размеров с другим прямоугольником|<span class="green-stable">stable</span>|
