# guic::Rect
A class representing a rectangle – stores the position of the top-left corner, the width and the height

## Constructors

* `Rect()` - Default constructor for creating an empty rectangle
* `Rect(int x, int y, int width, int height)` - Constructor for creating a rectangle with the given position, width and height

## Fields

|Type|Field|Purpose|Label|
|---|----|----------|-----|
|int|x|Left edge coordinate (default 0)|<span class="green-stable">stable</span>|
|int|y|Top edge coordinate (default 0)|<span class="green-stable">stable</span>|
|int|width|Width (default 0)|<span class="green-stable">stable</span>|
|int|height|Height (default 0)|<span class="green-stable">stable</span>|

## Methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|bool|isEmpty|Checks whether the rectangle is empty|<span class="green-stable">stable</span>|
|bool|contains|Checks whether the point (x, y) is inside the rectangle|<span class="green-stable">stable</span>|
|bool|contains(x, y, radius)|Checks whether the point (x, y) is inside a rectangle with rounded corners of radius `radius`. The radius is limited to half of the width and height|<span class="green-stable">stable</span>|
|bool|intersects|Checks whether the rectangle intersects another rectangle|<span class="green-stable">stable</span>|
|Rect|getClippedArea|Returns the intersection area with another rectangle|<span class="green-stable">stable</span>|
|Rect|getMerged|Returns a rectangle that combines this one and another rectangle|<span class="green-stable">stable</span>|
|bool|operator==|Compares the coordinates and sizes with another rectangle|<span class="green-stable">stable</span>|
|bool|operator!=|Checks whether the coordinates or sizes differ from those of another rectangle|<span class="green-stable">stable</span>|
