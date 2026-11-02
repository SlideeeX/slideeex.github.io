# guic::Color
A color class – stores the red, green, blue and alpha components (r, g, b, a)

## Constructors

* `Color()` - Default constructor for creating a color
* `Color(Uint32 hex)` - Creates a color from a number in the `0xRRGGBBAA` format (R is the most significant byte)
* `Color(std::string hex)` - Creates a color from a string `#RRGGBB` or `#RRGGBBAA`. A string in another format does not raise an error: magenta `#FF00FF` is returned
* `Color(Uint8 r, Uint8 g, Uint8 b)` - Creates a color from RGB components
* `Color(Uint8 r, Uint8 g, Uint8 b, Uint8 a)` - Creates a color from RGBA components

## Constants

Static color constants, available as `guic::Color::<Name>`.

* `Invisible` - Fully transparent color
* `Black`, `White`, `Red`, `Green`, `Blue`, `Yellow`, `Purple`, `Aqua` - Basic colors

## Methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|Uint8|getR|Returns the red component|<span class="green-stable">stable</span>|
|Uint8|getG|Returns the green component|<span class="green-stable">stable</span>|
|Uint8|getB|Returns the blue component|<span class="green-stable">stable</span>|
|Uint8|getA|Returns the alpha component|<span class="green-stable">stable</span>|
|Uint32|getHex|Returns the color as a number in the `0xRRGGBBAA` format|<span class="green-stable">stable</span>|
|bool|operator==|Compares the color with another color|<span class="green-stable">stable</span>|
|bool|operator!=|Compares "NOT EQUAL" the color with another color|<span class="green-stable">stable</span>|
