# guic::engine::Renderer
A renderer class – loads resources into the GPU and draws geometry in the window

## Constructors

* `Renderer(EngineWindowNative native)` - Constructor for creating a renderer bound to a native window
* `~Renderer()` - Frees the renderer's resources

## Methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|load|Queues a resource (`Resource`) for loading. The loading actually happens in `flush()`, which is called by `present()`|<span class="green-stable">stable</span>|
|void|unload|Queues a resource for unloading. Performed in `flush()` before the loads|<span class="green-stable">stable</span>|
|bool|isLoaded|Checks whether the resource is loaded into the renderer in its current version|<span class="green-stable">stable</span>|
|void|flush|Applies the deferred unloads, then the loads. For loading, the pixels are taken through `resource->load()`, copied into an atlas page, after which `resource->unload()` is called, so no copy remains in CPU memory|<span class="green-stable">stable</span>|
|void|draw|Draws geometry (`std::vector<Vertex>`) without a texture|<span class="green-stable">stable</span>|
|void|draw|Queues drawing of geometry with the texture of the given resource. If the resource is not loaded, it is queued for loading|<span class="green-stable">stable</span>|
|void|clear|Clears the whole renderer buffer with the given `Color`. The clipping area is not taken into account|<span class="green-stable">stable</span>|
|void|clearClip|Fills the current clipping area with black. The clipping area itself does not change|<span class="green-stable">stable</span>|
|void|present|Applies the queued loads and unloads (`flush`) and shows the drawn frame. Drawing commands are grouped by atlases|<span class="green-stable">stable</span>|
|void|setClipRect|Sets the clipping area|<span class="green-stable">stable</span>|
|Rect|getClippedRect|Returns the current clipping area|<span class="green-stable">stable</span>|
|Size|getMaxTextureSize|Returns the maximum texture size supported by the renderer|<span class="green-stable">stable</span>|
