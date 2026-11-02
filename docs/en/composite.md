# guic::Composite
A class that is the base for creating composite elements – groups elements into one object for manual (adopt/release) or automatic (add/remove) management

## Constructors

* `Composite()` - Default constructor for creating a composite element
* `Composite(Rect rect)` - Constructor for creating a composite element with the given rectangle
* `~Composite()` - Detaches and deletes the internal container <span class="green-stable">stable</span>

## Public methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|setRect|Sets the element's position and size|<span class="green-stable">stable</span>|
|void|setPosition|Sets the element's position|<span class="green-stable">stable</span>|
|void|setSize|Sets the element's size|<span class="green-stable">stable</span>|
|void|draw|Draws the composite element through the renderer|<span class="green-stable">stable</span>|
|void|control|Handles an event|<span class="green-stable">stable</span>|
|void|preload|Prepares resources for the renderer|<span class="yellow-stable">beta</span>|
|Element*|hit|Returns the element hit at point (x, y)|<span class="green-stable">stable</span>|
|Rect|collectDirtyRect|Returns the area that needs to be redrawn|<span class="green-stable">stable</span>|

## Protected methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|add|Adds an element to the internal container|<span class="green-stable">stable</span>|
|void|remove|Removes an element from the internal container|<span class="green-stable">stable</span>|
|void|adopt|Binds an element to the composite (`attachTo`)|<span class="yellow-stable">beta</span>|
|void|release|Unbinds an element from the composite (`detach`)|<span class="yellow-stable">beta</span>|
|void|detachChild|Detaches the child element `child` (takes a `const Element*`) through the internal container|<span class="red-stable">unstable</span>|

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
|Position|getPosition|Returns the element's position|<span class="green-stable">stable</span>|
|Size|getSize|Returns the element's size|<span class="green-stable">stable</span>|
|Rect|getRect|Returns the element's rectangle|<span class="green-stable">stable</span>|
|Rect|getGlobalRect|Returns the element's rectangle in global coordinates|<span class="green-stable">stable</span>|
|Rect|getVisibleRect|Returns the visible part of the element's rectangle|<span class="green-stable">stable</span>|
|Rect|getGlobalVisibleRect|Returns the visible part of the rectangle in global coordinates|<span class="green-stable">stable</span>|
|const Element*|getParent|Returns the parent element|<span class="yellow-stable">beta</span>|
|void|attachTo|Attaches the element to a parent|<span class="red-stable">unstable</span>|
|void|detach|Detaches the element from its parent|<span class="red-stable">unstable</span>|

## Inherited methods: protected Element

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|unchange|Resets the changed flag and `oldRect` after drawing|<span class="green-stable">stable</span>|
|Rect|rect|The element's rectangle (field)|<span class="green-stable">stable</span>|
|Rect|oldRect|The element's rectangle before the first change (field)|<span class="green-stable">stable</span>|
