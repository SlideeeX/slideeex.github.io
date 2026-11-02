# guic::engine::Resource
The base class of resources (images, fonts) that `Renderer` loads. Descendants, such as [Image](image.md) and [Font](font.md), implement `createBitmap()`, which builds the pixels of the resource. The pixel cache is managed by `Resource` itself.

## Constructors and destructor

* `Resource()` - Default constructor <span class="green-stable">stable</span>
* `Resource(const Resource&)`, `operator=(const Resource&)` - Deleted: a resource cannot be copied. The cache is moved between resources by `pull()` <span class="green-stable">stable</span>
* `~Resource()` - Virtual destructor <span class="green-stable">stable</span>

## Public methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|const Bitmap*|load|Returns the resource's pixels from the cache. If there is no cache, or the version has changed and there are no active references, builds it through `createBitmap()`. Each call increments the cache reference count; a paired call is `unload()`|<span class="green-stable">stable</span>|
|void|unload|Decrements the cache reference count. When the count reaches zero, the pixels are freed|<span class="green-stable">stable</span>|
|bool|isMetadataLoaded|Checks whether the resource's metadata is loaded|<span class="green-stable">stable</span>|
|Uint32|getRevision|Returns the version of the resource's content. The version increases when the content changes; `Renderer` reloads the resource when the versions diverge|<span class="green-stable">stable</span>|
|Uint32|getCacheRevision|Returns the version for which the current pixel cache was built|<span class="green-stable">stable</span>|
|bool|pull(Resource*& src)|Takes the cache and metadata from the resource `src`, if it has exactly one cache reference and the current resource has no references. Afterwards `src` is deleted and the pointer is set to null. Needed to replace a resource without reloading its pixels|<span class="green-stable">stable</span>|

## Protected methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|Bitmap*|createBitmap() = 0|Pure virtual. Builds the pixels of the resource. Implemented in descendants; the result is cached by `Resource`|<span class="green-stable">stable</span>|
|void|nextRevision|Increments the resource's version, signalling the renderer that a reload is needed|<span class="green-stable">stable</span>|
|bool|copyMetadataFrom(Resource& src)|Copies the metadata from `src` during `pull`. The base class copies nothing and returns `true`. Descendants override the method|<span class="green-stable">stable</span>|

## Protected fields

|Type|Field|Purpose|Label|
|---|----|----------|-----|
|bool|is_metadata_loaded|Flag that the resource's metadata is loaded|<span class="green-stable">stable</span>|
