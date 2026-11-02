# guic::Font
A font resource class – loads a font from a file at the given size, builds a glyph atlas and stores kerning. Inherits `engine::Resource`

## Constructors

* `Font(const std::string& path, Uint32 font_size)` - Constructor for creating a font from the file at `path` with size `font_size`

## Pack structure
A set of character codepoints to be loaded into the atlas. Stores the list `codepoints`. Methods: `contains(Uint32 codepoint)` - checks whether a codepoint is present, `size()` - the number of codepoints, `make(const std::string& characters)` - creates a set from a string of characters.

The service constant `MissingGlyphCodepoint` (`0xFFFFFFFF`) is private and not exposed. It is used for the placeholder glyph that replaces a character missing from the loaded sets.

## Ready-made sets

|Name|Purpose|Label|
|--------|----------|-----|
|EN|Latin letters|<span class="green-stable">stable</span>|
|RU|Russian letters|<span class="green-stable">stable</span>|
|Sign|Space, punctuation marks and symbols|<span class="green-stable">stable</span>|

The full contents of the sets can be found in `resources/Font.cpp`.

## Methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|engine::Bitmap*|createBitmap|Builds the glyph atlas of the font. Overrides `Resource::createBitmap()`, called when the resource is loaded|<span class="green-stable">stable</span>|
|void|addPack|Adds a character set (`Pack`) to the font|<span class="green-stable">stable</span>|
|void|addPack|Adds a character set from a string to the font|<span class="green-stable">stable</span>|
|engine::Glyph|getGlyph|Returns the glyph for a codepoint. If the codepoint is not in the loaded sets, returns the placeholder glyph|<span class="green-stable">stable</span>|
|int|getKerning|Returns the kerning between two codepoints in pixels. Returns 0 if there is no pair or if one of the codepoints is not in the loaded sets|<span class="yellow-stable">beta</span>|
|int|getLineHeight|Returns the line height|<span class="green-stable">stable</span>|
|int|getAscent|Returns the ascent above the baseline|<span class="yellow-stable">beta</span>|
|int|getDescent|Returns the descent below the baseline|<span class="yellow-stable">beta</span>|
|Uint32|getFontSize|Returns the font size set in the constructor|<span class="green-stable">stable</span>|
|Size|getAtlasSize|Returns the size of the glyph atlas fitted to the loaded sets|<span class="green-stable">stable</span>|

The methods inherited from `engine::Resource` (`load`, `unload`, `getRevision`, `isMetadataLoaded`) are described on the [Resource](resource.md) page.
