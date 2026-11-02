# guic::engine::Bitmap
Структура является набором пикселей изображения - ширина, высота и массив байтов пикселей. Возвращается из `Resource::load()`

## Поля

|Тип|Поле|Назначение|Метка|
|---|----|----------|-----|
|Uint16|width|Ширина в пикселях (по умолчанию 0)|<span class="green-stable">stable</span>|
|Uint16|height|Высота в пикселях (по умолчанию 0)|<span class="green-stable">stable</span>|
|std::vector<Uint8>|pixels|Байты пикселей|<span class="green-stable">stable</span>|
