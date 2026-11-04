# guic::Sprite
A class representing a sprite – a rectangle filled with a color or an image, with optionally rounded corners

## Constructors

* `Sprite()` - Default constructor for creating a sprite <span class="yellow-stable">beta</span>
* `Sprite(Rect rect)` - Constructor for creating a sprite with the given rectangle <span class="yellow-stable">beta</span>
* `Sprite(Rect rect, Image& image)` - Constructor for creating a sprite with the given rectangle and image <span class="yellow-stable">beta</span>
* `Sprite(Rect rect, Color color)` - Constructor for creating a sprite with the given rectangle and color <span class="yellow-stable">beta</span>

## Enumeration Mode - sprite fill modes

|Name|Purpose|Label|
|--------|----------|-----|
|Color|Fill with a color|<span class="green-stable">stable</span>|
|Image|Fill with an image without tinting: the sprite's color does not affect the image|<span class="green-stable">stable</span>|
|Mashup|Fill with an image tinted by the sprite's color. The mode is kept when `setImage` and `setColor` are called|<span class="green-stable">stable</span>|

## Public methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|setImage|Sets the sprite's image and switches the sprite to the `Image` mode. In the `Mashup` mode the mode does not change|<span class="green-stable">stable</span>|
|const Image*|getImage|Returns the sprite's image|<span class="green-stable">stable</span>|
|void|setImageRect|Sets the area of the image that will be shown|<span class="green-stable">stable</span>|
|void|setColor|Sets the sprite's color and switches the sprite to the `Color` mode. In the `Mashup` mode the mode does not change, and the color tints the image|<span class="green-stable">stable</span>|
|Color|getColor|Returns the sprite's color|<span class="green-stable">stable</span>|
|void|setRadius|Sets the corner rounding radius|<span class="yellow-stable">beta</span>|
|int|getRadius|Returns the corner rounding radius|<span class="yellow-stable">beta</span>|
|void|setMode|Sets the fill mode|<span class="yellow-stable">beta</span>|
|Mode|getMode|Returns the fill mode|<span class="yellow-stable">beta</span>|
|void|preload|Prepares the sprite's resources for the renderer|<span class="yellow-stable">beta</span>|
|void|draw|Draws the sprite through the renderer|<span class="yellow-stable">beta</span>|
|Element*|hit|Returns the element that contains the point (x, y)|<span class="yellow-stable">beta</span>|

## Protected methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|std::vector<engine::Vertex>|geometry|The sprite's geometry vertices (field)|<span class="red-stable">unstable</span>|
|void|buildGeometry|Builds the sprite's geometry|<span class="red-stable">unstable</span>|
|void|buildRoundedGeometry|Builds the sprite's geometry with rounded corners|<span class="red-stable">unstable</span>|
|Rect|imageRect|The area of the image that will be shown (field)|<span class="yellow-stable">beta</span>|
|bool|calculateImageRect|Whether `imageRect` must be recalculated (field, default `true`)|<span class="yellow-stable">beta</span>|
|static constexpr int|cornerSegments|Number of segments per rounded corner (field, `4`)|<span class="red-stable">unstable</span>|
|static constexpr float|arcTolerance|Approximation tolerance of the corner arc (field, `0.2f`)|<span class="red-stable">unstable</span>|

## Inherited methods: public Element

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|bool|isShow|Checks whether the element is shown|<span class="green-stable">stable</span>|
|bool|isChanged|Checks whether the element has changed since the last draw|<span class="green-stable">stable</span>|
|void|show|Makes the element visible|<span class="green-stable">stable</span>|
|void|hide|Hides the element|<span class="green-stable">stable</span>|
|void|update|Marks the element for update|<span class="green-stable">stable</span>|
|void|setLayer|Sets the element's layer|<span class="green-stable">stable</span>|
|Uint16|getLayer|Returns the element's layer|<span class="green-stable">stable</span>|
|void|setHit|Enables or disables the element's reaction to the cursor hitting it|<span class="green-stable">stable</span>|
|bool|isHit|Checks whether the element reacts to the cursor hitting it|<span class="green-stable">stable</span>|
|void|setPosition|Sets the element's position (virtual)|<span class="green-stable">stable</span>|
|void|setSize|Sets the element's size (virtual)|<span class="green-stable">stable</span>|
|void|setRect|Sets the element's position and size (virtual)|<span class="red-stable">unstable</span>|
|Position|getPosition|Returns the element's position|<span class="green-stable">stable</span>|
|Size|getSize|Returns the element's size|<span class="green-stable">stable</span>|
|Rect|getRect|Returns the element's rectangle|<span class="red-stable">unstable</span>|
|Rect|getGlobalRect|Returns the element's rectangle in global coordinates|<span class="red-stable">unstable</span>|
|Rect|getVisibleRect|Returns the visible part of the element's rectangle|<span class="red-stable">unstable</span>|
|Rect|getGlobalVisibleRect|Returns the visible part of the rectangle in global coordinates|<span class="red-stable">unstable</span>|
|Rect|collectDirtyRect|Returns the area that needs to be redrawn (virtual)|<span class="red-stable">unstable</span>|
|const Element*|getParent|Returns the parent element|<span class="yellow-stable">beta</span>|
|void|control|Handles an `Event` (virtual)|<span class="green-stable">stable</span>|
|void|attachTo|Attaches the element to a parent|<span class="red-stable">unstable</span>|
|void|detach|Detaches the element from its parent|<span class="red-stable">unstable</span>|
|void|detachChild|Detaches a child element (virtual)|<span class="red-stable">unstable</span>|

## Inherited methods: protected Element

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|unchange|Resets the change flag and `oldRect` after drawing|<span class="yellow-stable">beta</span>|
|Rect|rect|The element's rectangle (field)|<span class="red-stable">unstable</span>|
|Rect|oldRect|The element's rectangle before the first change (field)|<span class="red-stable">unstable</span>|
