# guic::engine::Renderer
Класс является рендерером - загружает ресурсы в GPU и рисует геометрию в окне

## Конструкторы

* `Renderer(EngineWindowNative native)` - Конструктор для создания рендерера, привязанного к нативному окну
* `~Renderer()` - Освобождает ресурсы рендерера

## Методы

|Тип|Метод|Назначение|Метка|
|---|-----|----------|-----|
|void|load|Ставит ресурс (`Resource`) в очередь на загрузку. Реально загрузка выполняется в `flush()`, который вызывает `present()`|<span class="green-stable">stable</span>|
|void|unload|Ставит ресурс в очередь на выгрузку. Выполняется в `flush()` до загрузок|<span class="green-stable">stable</span>|
|bool|isLoaded|Проверяет, загружен ли ресурс в рендерер в актуальной версии|<span class="green-stable">stable</span>|
|void|flush|Применяет отложенные выгрузки, затем загрузки. Для загрузки берутся пиксели через `resource->load()`, копируются в страницу атласа, после чего вызывается `resource->unload()`, поэтому копия в памяти CPU не остаётся|<span class="green-stable">stable</span>|
|void|draw|Рисует геометрию (`std::vector<Vertex>`) без текстуры|<span class="yellow-stable">beta</span>|
|void|draw|Ставит в очередь отрисовку геометрии с текстурой указанного ресурса. Если ресурс не загружен, он ставится в очередь на загрузку|<span class="yellow-stable">beta</span>|
|void|clear|Очищает весь буфер рендерера заданным цветом `Color`. Область отсечения не учитывается|<span class="green-stable">stable</span>|
|void|clearClip|Заливает чёрным текущую область отсечения. Сама область отсечения не меняется|<span class="green-stable">stable</span>|
|void|present|Применяет очереди загрузок и выгрузок (`flush`) и показывает нарисованный кадр. Команды рисования группируются по атласам|<span class="green-stable">stable</span>|
|void|setClipRect|Устанавливает область отсечения|<span class="yellow-stable">beta</span>|
|Rect|getClippedRect|Возвращает текущую область отсечения|<span class="yellow-stable">beta</span>|
|Size|getMaxTextureSize|Возвращает максимальный размер текстуры, поддерживаемый рендерером|<span class="green-stable">stable</span>|
