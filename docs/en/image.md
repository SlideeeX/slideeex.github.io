# guic::Image
A picture resource class – loads an image from a file and passes it to the renderer. Inherits `engine::Resource`

## Supported formats

Images are loaded with stb_image. The format is detected from the file content, not from the extension.

* PNG
* JPEG
* BMP
* GIF - only the first frame; animation is not supported
* TGA
* PSD - the flattened image; layers are not read
* HDR - converted to 8-bit
* PIC
* PNM - binary PPM and PGM only

Not supported: SVG, WebP, AVIF, TIFF and other formats. For them the image is not loaded.

## Constructors

* `Image(const std::string& path)` - Constructor for creating an image from the file at `path`

## Methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|engine::Bitmap*|createBitmap|Loads the image pixels from the file and converts them to RGBA32. Overrides `Resource::createBitmap()`|<span class="green-stable">stable</span>|
|Size|getSize|Returns the image size. The value appears after the first resource load; until then the size is zero|<span class="green-stable">stable</span>|

The methods inherited from `engine::Resource` (`load`, `unload`, `getRevision`, `isMetadataLoaded`) are described on the [Resource](resource.md) page.
