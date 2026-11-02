# guic::engine::Resource
Базовый класс ресурсов (изображения, шрифты), которые загружает `Renderer`. Потомки, например [Image](image.md) и [Font](font.md), реализуют `createBitmap()`, который строит пиксели ресурса. Кэш пикселей ведёт сам `Resource`.

## Конструкторы и деструктор

* `Resource()` - Конструктор по умолчанию <span class="green-stable">stable</span>
* `Resource(const Resource&)`, `operator=(const Resource&)` - Удалены: ресурс нельзя копировать. Перенос кэша между ресурсами делает `pull()` <span class="green-stable">stable</span>
* `~Resource()` - Виртуальный деструктор <span class="green-stable">stable</span>

## Публичные методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|const Bitmap*|load|Возвращает пиксели ресурса из кэша. Если кэша нет или версия изменилась и активных ссылок нет, строит его через `createBitmap()`. Каждый вызов увеличивает счётчик ссылок кэша, парным вызовом считается `unload()`|<span class="green-stable">stable</span>|
|void|unload|Уменьшает счётчик ссылок кэша. Когда счётчик доходит до нуля, пиксели освобождаются|<span class="green-stable">stable</span>|
|bool|isMetadataLoaded|Проверяет, загружены ли метаданные ресурса|<span class="green-stable">stable</span>|
|Uint32|getRevision|Возвращает версию содержимого ресурса. Версия увеличивается при изменении содержимого, `Renderer` перезагружает ресурс при расхождении версий|<span class="green-stable">stable</span>|
|Uint32|getCacheRevision|Возвращает версию, для которой собран текущий кэш пикселей|<span class="green-stable">stable</span>|
|bool|pull(Resource*& src)|Забирает кэш и метаданные у ресурса `src`, если у него ровно одна ссылка на кэш, а у текущего ресурса ссылок нет. После этого `src` удаляется, а указатель обнуляется. Нужен, чтобы заменить ресурс без повторной загрузки пикселей|<span class="green-stable">stable</span>|

## Защищённые методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|Bitmap*|createBitmap() = 0|Чисто виртуальный. Строит пиксели ресурса. Реализуется в потомках; результат кэширует `Resource`|<span class="green-stable">stable</span>|
|void|nextRevision|Увеличивает версию ресурса, сигнализируя рендереру о необходимости перезагрузки|<span class="green-stable">stable</span>|
|bool|copyMetadataFrom(Resource& src)|Копирует метаданные из `src` при `pull`. В базовом классе ничего не копирует и возвращает `true`. Потомки переопределяют метод|<span class="green-stable">stable</span>|

## Защищённые поля

|Тип|Поле|Назначение|Метка|
|---|----|----------|-----|
|bool|is_metadata_loaded|Флаг, что метаданные ресурса загружены|<span class="green-stable">stable</span>|
