# guic::Font
Класс является ресурсом шрифта - загружает шрифт из файла заданного размера, собирает атлас глифов и хранит кернинг. Наследует `engine::Resource`

## Конструкторы

* `Font(const std::string& path, Uint32 font_size)` - Конструктор для создания шрифта из файла по пути `path` с размером `font_size`

## Структура Pack
Набор кодовых точек символов, которые нужно загрузить в атлас. Хранит список `codepoints`. Методы: `contains(Uint32 codepoint)` - проверяет наличие кодовой точки, `size()` - количество кодовых точек, `make(const std::string& characters)` - создаёт набор из строки символов.

Служебная константа `MissingGlyphCodepoint` (`0xFFFFFFFF`) закрытая (private) и наружу не открыта. Она нужна для глифа-заглушки, которым заменяется символ, отсутствующий в загруженных наборах.
## Готовые наборы
|Название|Назначение|Метка|
|--------|----------|-----|
|EN|Латинские буквы|<span class="green-stable">stable</span>|
|RU|Русские буквы|<span class="green-stable">stable</span>|
|Sign|Пробел, знаки препинания и символы|<span class="green-stable">stable</span>|
Полный состав наборов см. в `resources/Font.cpp`.

## Методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|engine::Bitmap*|createBitmap|Строит атлас глифов шрифта. Переопределяет `Resource::createBitmap()`, вызывается при загрузке ресурса|<span class="green-stable">stable</span>|
|void|addPack|Добавляет набор символов (`Pack`) в шрифт|<span class="green-stable">stable</span>|
|void|addPack|Добавляет набор символов из строки в шрифт|<span class="green-stable">stable</span>|
|engine::Glyph|getGlyph|Возвращает глиф для кодовой точки. Если кодовой точки нет в загруженных наборах, возвращает глиф-заглушку|<span class="green-stable">stable</span>|
|int|getKerning|Возвращает кернинг между двумя кодовыми точками в пикселях. Возвращает 0, если пары нет или одна из кодовых точек не входит в загруженные наборы|<span class="yellow-stable">beta</span>|
|int|getLineHeight|Возвращает высоту строки|<span class="green-stable">stable</span>|
|int|getAscent|Возвращает подъём над базовой линией|<span class="yellow-stable">beta</span>|
|int|getDescent|Возвращает спуск под базовую линию|<span class="yellow-stable">beta</span>|
|Uint32|getFontSize|Возвращает размер шрифта, заданный в конструкторе|<span class="green-stable">stable</span>|
|Size|getAtlasSize|Возвращает размер атласа глифов, подобранный под загруженные наборы|<span class="green-stable">stable</span>|

Методы, унаследованные от `engine::Resource` (`load`, `unload`, `getRevision`, `isMetadataLoaded`), описаны на странице [Resource](resource.md).
