# guic::engine::Bitmap
A structure holding the pixels of an image – width, height and an array of pixel bytes. Returned by `Resource::load()`

## Fields

|Type|Field|Purpose|Label|
|---|----|----------|-----|
|Uint16|width|Width in pixels (default 0)|<span class="green-stable">stable</span>|
|Uint16|height|Height in pixels (default 0)|<span class="green-stable">stable</span>|
|std::vector<Uint8>|pixels|Pixel bytes|<span class="green-stable">stable</span>|
