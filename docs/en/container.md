# guic::Container
A container element – holds child elements and passes events and drawing to them. Added elements are bound to the Container, so a strict hierarchy applies – any element belongs to only one parent.

## Constructors

* `Container()` - Default constructor for creating a container
* `Container(Rect rect)` - Constructor for creating a container with the given rectangle

## Public methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|add|Adds a child element|<span class="green-stable">stable</span>|
|void|remove|Removes a child element|<span class="green-stable">stable</span>|
|void|clear|Removes all child elements|<span class="green-stable">stable</span>|
|void|detachChild|Detaches the child element `child` (takes a `const Element*`)|<span class="red-stable">unstable</span>|
|void|setRect|Sets the container's position and size|<span class="green-stable">stable</span>|
|void|setPosition|Sets the container's position|<span class="green-stable">stable</span>|
|void|setSize|Sets the container's size|<span class="green-stable">stable</span>|
|Rect|collectDirtyRect|Returns the area that needs to be redrawn|<span class="green-stable">stable</span>|
|void|control|Passes an event to the child elements|<span class="green-stable">stable</span>|
|void|preload|Prepares the child elements' resources for the renderer|<span class="yellow-stable">beta</span>|
|void|draw|Draws the child elements through the renderer|<span class="green-stable">stable</span>|
|Element*|hit|Returns the topmost child element hit at point (x, y), or `nullptr`|<span class="green-stable">stable</span>|

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
