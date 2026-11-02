# guic::engine::EngineWindow
A low-level platform window class – creates the native window and owns the renderer. `Window` works through it

## Constructors

* `EngineWindow()` - Default constructor for creating a window
* `EngineWindow(std::string name, Size size)` - Constructor for creating a window with the given title and size
* `EngineWindow(const EngineWindow&)` - Copying is forbidden
* `EngineWindow& operator=(const EngineWindow&)` - Assignment is forbidden

## Methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|open|Opens the window|<span class="green-stable">stable</span>|
|void|close|Closes the window|<span class="green-stable">stable</span>|
|void|show|Shows the window|<span class="green-stable">stable</span>|
|void|hide|Hides the window|<span class="green-stable">stable</span>|
|void|focus|Moves focus to the window|<span class="green-stable">stable</span>|
|void|setSize|Sets the window size|<span class="green-stable">stable</span>|
|void|setName|Sets the window title|<span class="green-stable">stable</span>|
|void|display|Outputs the window contents to the screen|<span class="green-stable">stable</span>|
|void|setClipRect|Sets the clipping area for drawing|<span class="green-stable">stable</span>|
|void|load|Loads a resource into the window renderer|<span class="green-stable">stable</span>|
|void|unload|Unloads a resource from the window renderer|<span class="green-stable">stable</span>|
|bool|isOpen|Checks whether the window is open|<span class="green-stable">stable</span>|
|bool|isShow|Checks whether the window is shown|<span class="green-stable">stable</span>|
|bool|isFocused|Checks whether the window has focus|<span class="green-stable">stable</span>|
|Uint32|getId|Returns the window identifier|<span class="green-stable">stable</span>|
|Renderer*|getRenderer|Returns the window renderer|<span class="green-stable">stable</span>|
|Size|getSize|Returns the window size|<span class="green-stable">stable</span>|
|std::string|getName|Returns the window title|<span class="green-stable">stable</span>|
