# guic::Text
A class representing text – draws a string in the given font and color

## Constructors

* `Text()` - Default constructor for creating text <span class="yellow-stable">beta</span>
* `Text(Rect rect)` - Constructor for creating text with the given rectangle <span class="yellow-stable">beta</span>
* `Text(Rect rect, const std::string& str)` - Constructor for creating text with the given rectangle and string <span class="yellow-stable">beta</span>
* `Text(Rect rect, const std::string& str, Font& font)` - Constructor for creating text with the given rectangle, string and font <span class="yellow-stable">beta</span>

## Public methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|setString|Sets the text string|<span class="green-stable">stable</span>|
|void|setFont|Sets the text font|<span class="green-stable">stable</span>|
|void|setColor|Sets the text color|<span class="green-stable">stable</span>|
|std::string|getString|Returns the text string|<span class="green-stable">stable</span>|
|const Font*|getFont|Returns the text font|<span class="green-stable">stable</span>|
|Color|getColor|Returns the text color|<span class="green-stable">stable</span>|
|void|preload|Prepares the text's resources for the renderer|<span class="yellow-stable">beta</span>|
|void|draw|Draws the text through the renderer|<span class="yellow-stable">beta</span>|

## Protected methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|buildGeometry|Builds the text's geometry|<span class="red-stable">unstable</span>|
|std::vector<engine::Vertex>|textGeometry|The text's geometry vertices (field)|<span class="red-stable">unstable</span>|

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
|Element*|hit|Returns the element that contains the point (x, y) (virtual)|<span class="yellow-stable">beta</span>|
|void|attachTo|Attaches the element to a parent|<span class="red-stable">unstable</span>|
|void|detach|Detaches the element from its parent|<span class="red-stable">unstable</span>|
|void|detachChild|Detaches a child element (virtual)|<span class="red-stable">unstable</span>|

## Inherited methods: protected Element

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|unchange|Resets the change flag and `oldRect` after drawing|<span class="yellow-stable">beta</span>|
|Rect|rect|The element's rectangle (field)|<span class="red-stable">unstable</span>|
|Rect|oldRect|The element's rectangle before the first change (field)|<span class="red-stable">unstable</span>|
