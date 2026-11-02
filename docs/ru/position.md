# guic::Position
Класс является представлением позиции - хранит координаты x и y

## Конструкторы

* `Position()` - Конструктор для создания пустой позиции
* `Position(int x, int y)` - Конструктор для создания позиции с заданными координатами

## Поля

|Тип|Поле|Назначение|Метка|
|---|----|----------|-----|
|int|x|Координата по горизонтали (по умолчанию 0)|<span class="green-stable">stable</span>|
|int|y|Координата по вертикали (по умолчанию 0)|<span class="green-stable">stable</span>|

## Методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|Position|operator+|Сложение координат с координатами другой позиции|<span class="green-stable">stable</span>|
|Position|operator-|Вычитание координат другой позиции|<span class="green-stable">stable</span>|
|bool|operator==|Сравнение координат с координатами другой позиции|<span class="green-stable">stable</span>|
|bool|operator!=|Сравнение "НЕ" координат с координатами другой позиции|<span class="green-stable">stable</span>|
