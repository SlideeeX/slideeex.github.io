# guic::Color
Класс является представлением цвета - хранит компоненты красного, зелёного, синего и альфа-канала (r, g, b, a)

## Конструкторы

* `Color()` - Базовый конструктор для создания цвета
* `Color(Uint32 hex)` - Конструктор для создания цвета из числа в формате `0xRRGGBBAA` (R - старший байт)
* `Color(std::string hex)` - Конструктор для создания цвета из строки `#RRGGBB` или `#RRGGBBAA`. Строка в другом формате не вызывает ошибку: возвращается пурпурный цвет `#FF00FF`
* `Color(Uint8 r, Uint8 g, Uint8 b)` - Конструктор для создания цвета из компонент RGB
* `Color(Uint8 r, Uint8 g, Uint8 b, Uint8 a)` - Конструктор для создания цвета из компонент RGBA

## Константы

Статические константы цветов, доступные как `guic::Color::<Имя>`.

* `Invisible` - Полностью прозрачный цвет
* `Black`, `White`, `Red`, `Green`, `Blue`, `Yellow`, `Purple`, `Aqua` - Базовые цвета

## Методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|Uint8|getR|Возвращает компоненту красного|<span class="green-stable">stable</span>|
|Uint8|getG|Возвращает компоненту зелёного|<span class="green-stable">stable</span>|
|Uint8|getB|Возвращает компоненту синего|<span class="green-stable">stable</span>|
|Uint8|getA|Возвращает компоненту альфа-канала|<span class="green-stable">stable</span>|
|Uint32|getHex|Возвращает цвет в виде числа в формате `0xRRGGBBAA`|<span class="green-stable">stable</span>|
|bool|operator==|Сравнение цвета с другим цветом|<span class="green-stable">stable</span>|
|bool|operator!=|Сравнение "НЕ" цвета с другим цветом|<span class="green-stable">stable</span>|
