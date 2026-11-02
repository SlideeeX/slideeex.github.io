# guic::engine::Glyph
Структура описывает один глиф шрифта - его прямоугольник в атласе и метрики для выравнивания

## Поля

|Тип|Поле|Назначение|Метка|
|---|----|----------|-----|
|Uint16|x|Координата глифа по горизонтали в атласе (по умолчанию 0)|<span class="green-stable">stable</span>|
|Uint16|y|Координата глифа по вертикали в атласе (по умолчанию 0)|<span class="green-stable">stable</span>|
|Uint16|width|Ширина глифа (по умолчанию 0)|<span class="green-stable">stable</span>|
|Uint16|height|Высота глифа (по умолчанию 0)|<span class="green-stable">stable</span>|
|Sint16|advance|Смещение курсора после глифа (по умолчанию 0)|<span class="green-stable">stable</span>|
|Sint16|bearing_x|Горизонтальный отступ глифа от курсора (по умолчанию 0)|<span class="green-stable">stable</span>|
|Sint16|bearing_y|Вертикальный отступ глифа от базовой линии (по умолчанию 0)|<span class="green-stable">stable</span>|
