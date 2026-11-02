# guic::engine::Glyph
A structure describing one font glyph – its rectangle in the atlas and its alignment metrics

## Fields

|Type|Field|Purpose|Label|
|---|----|----------|-----|
|Uint16|x|Horizontal position of the glyph in the atlas (default 0)|<span class="green-stable">stable</span>|
|Uint16|y|Vertical position of the glyph in the atlas (default 0)|<span class="green-stable">stable</span>|
|Uint16|width|Glyph width (default 0)|<span class="green-stable">stable</span>|
|Uint16|height|Glyph height (default 0)|<span class="green-stable">stable</span>|
|Sint16|advance|Cursor advance after the glyph (default 0)|<span class="green-stable">stable</span>|
|Sint16|bearing_x|Horizontal offset of the glyph from the cursor (default 0)|<span class="green-stable">stable</span>|
|Sint16|bearing_y|Vertical offset of the glyph from the baseline (default 0)|<span class="green-stable">stable</span>|
