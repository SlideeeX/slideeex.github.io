# guic::Size
Класс является представлением размера - хранит высоту и ширину

## Конструкторы

* `Size()` - Базовый конструктор для создания пустого размера
* `Size(int width, int height)` - Конструктор для создания размера с заданными шириной и высотой

## Поля

|Тип|Поле|Назначение|Метка|
|---|----|----------|-----|
|int|width|Ширина (По умолчанию 0)|<span class="green-stable">stable</span>|
|int|height|Высота (По умолчанию 0)|<span class="green-stable">stable</span>|

## Методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|Size|operator+|Сложение высоты с высотой и ширины с шириной другого размера|<span class="green-stable">stable</span>|
|Size|operator-|Вычитание высоты с высотой и ширины с шириной другого размера|<span class="green-stable">stable</span>|
|bool|operator==|Сравнение высоты с высотой и ширины с шириной другого размера|<span class="green-stable">stable</span>|
|bool|operator!=|Сравнение "НЕ" высоты с высотой и ширины с шириной другого размера|<span class="green-stable">stable</span>|