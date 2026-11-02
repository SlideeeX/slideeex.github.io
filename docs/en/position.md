# guic::Position
A class representing a position – stores the x and y coordinates

## Constructors

* `Position()` - Constructor for creating an empty position
* `Position(int x, int y)` - Constructor for creating a position with the given coordinates

## Fields

|Type|Field|Purpose|Label|
|---|----|----------|-----|
|int|x|Horizontal coordinate (default 0)|<span class="green-stable">stable</span>|
|int|y|Vertical coordinate (default 0)|<span class="green-stable">stable</span>|

## Methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|Position|operator+|Adds the coordinates of another position|<span class="green-stable">stable</span>|
|Position|operator-|Subtracts the coordinates of another position|<span class="green-stable">stable</span>|
|bool|operator==|Compares the coordinates with those of another position|<span class="green-stable">stable</span>|
|bool|operator!=|Checks whether the coordinates differ from those of another position|<span class="green-stable">stable</span>|
