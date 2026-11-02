# guic::Size
A class representing a size – stores the height and the width

## Constructors

* `Size()` - Default constructor for creating an empty size
* `Size(int width, int height)` - Constructor for creating a size with the given width and height

## Fields

|Type|Field|Purpose|Label|
|---|----|----------|-----|
|int|width|Width (default 0)|<span class="green-stable">stable</span>|
|int|height|Height (default 0)|<span class="green-stable">stable</span>|

## Methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|Size|operator+|Adds the height to the height and the width to the width of another size|<span class="green-stable">stable</span>|
|Size|operator-|Subtracts the height from the height and the width from the width of another size|<span class="green-stable">stable</span>|
|bool|operator==|Compares the height with the height and the width with the width of another size|<span class="green-stable">stable</span>|
|bool|operator!=|Checks whether the height or the width differs from those of another size|<span class="green-stable">stable</span>|
