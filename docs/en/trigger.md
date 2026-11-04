# guic::Trigger
A class representing an event handler – runs a callback when a condition is met, or when keys and mouse buttons are pressed

## Constructors

* `Trigger()` - Default constructor for creating a trigger <span class="yellow-stable">beta</span>
* `Trigger(Rect rect)` - Constructor for creating a trigger with the given rectangle <span class="yellow-stable">beta</span>

## Public methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|on|Sets the activation condition without arguments (`std::function<bool()>`)|<span class="green-stable">stable</span>|
|void|on|Sets the activation condition based on an event (`std::function<bool(const Event*)>`)|<span class="green-stable">stable</span>|
|void|bind|Sets a callback without arguments (`std::function<void()>`)|<span class="green-stable">stable</span>|
|void|bind|Sets a callback that receives the event (`std::function<void(const Event*)>`)|<span class="green-stable">stable</span>|
|void|onKey|Sets a callback for pressing the key `keys` (fires only on `KeyPressed`). The modifiers Shift, Ctrl, Alt and GUI included in `keys` must be held down. If `keys` contains no modifiers, held modifiers are not allowed (CapsLock, NumLock and ScrollLock are not taken into account)|<span class="green-stable">stable</span>|
|void|onKeys|Sets a callback for pressing any of the listed keys `keys` (combinations are not supported)|<span class="green-stable">stable</span>|
|void|onLMB|Sets a callback for a left mouse button click (the press and the release happened over the same element)|<span class="green-stable">stable</span>|
|void|onRMB|Sets a callback for releasing the right mouse button|<span class="green-stable">stable</span>|
|void|onHover|Sets a callback `std::function<void(bool hovered)>`, which is called when the cursor's hover state over the trigger changes (taking the radius into account)|<span class="green-stable">stable</span>|
|void|control|Handles an event and calls the callback if the condition is met|<span class="green-stable">stable</span>|
|void|setRadius|Sets the corner radius of the activation area (negative values are treated as 0)|<span class="yellow-stable">beta</span>|
|int|getRadius|Returns the corner radius of the activation area|<span class="yellow-stable">beta</span>|
|Element*|hit|Returns the trigger if the point (x, y) falls into its area taking the radius into account, otherwise `nullptr`. With radius 0 it works as the base `Element::hit`|<span class="yellow-stable">beta</span>|
|Rect|collectDirtyRect|Always returns an empty rectangle (the trigger does not need redrawing)|<span class="red-stable">unstable</span>|

## Protected methods

There are no protected methods or fields.

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
|void|preload|Prepares the element's resources for the renderer (virtual)|<span class="yellow-stable">beta</span>|
|void|draw|Draws the element through the renderer (virtual)|<span class="yellow-stable">beta</span>|
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
