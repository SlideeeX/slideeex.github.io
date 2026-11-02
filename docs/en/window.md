# guic::Window
A class representing a window – creates the window, manages its state and holds its elements

## Constructors

* `Window()` - Default constructor for creating a window. Initializes Guic if it has not been initialized yet
* `Window(std::string name, Size size)` - Constructor for creating a window with the given name and size
* `Window(const Window&)` - Copying is forbidden
* `Window& operator=(const Window&)` - Assignment is forbidden

## Destructor

* `~Window()` - Removes the window from the list of Guic windows. If no windows remain, calls `config::guic_quit()` <span class="green-stable">stable</span>

## Methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|void|tune|Tunes the window - takes events from the Guic queue, passes them to the windows and runs element processing (see below)|<span class="green-stable">stable</span>|
|void|display|Builds the geometry of the elements and outputs the window contents to the screen, taking into account the local FPS and dirty areas|<span class="green-stable">stable</span>|
|void|setFPS|Sets the window's frame rate. The default is 60; the value 0 removes the limit|<span class="green-stable">stable</span>|
|void|redrawNextFrame|Requests a redraw on the next frame|<span class="green-stable">stable</span>|
|void|open|Opens the window and shows it|<span class="green-stable">stable</span>|
|void|close|Closes the window, clears its events and stops processing events|<span class="green-stable">stable</span>|
|void|closeEventSkip|Disables the automatic closing of the window on the `WindowClosed` event. The flag cannot be reset: after the call the window does not close by itself, and the application must close it|<span class="green-stable">stable</span>|
|void|show|Shows the window|<span class="green-stable">stable</span>|
|void|hide|Hides the window; event processing continues in the background|<span class="green-stable">stable</span>|
|void|focus|Requests that focus be set on the window|<span class="green-stable">stable</span>|
|void|setSize|Sets the window size|<span class="green-stable">stable</span>|
|void|setName|Sets the window name|<span class="green-stable">stable</span>|
|void|load|Adds a resource for this window to the queue for loading into the renderer|<span class="green-stable">stable</span>|
|void|unload|Adds a resource for this window to the queue for unloading from the renderer. Unloading is performed at the next `flush()` of the renderer|<span class="green-stable">stable</span>|
|void|pushEvent|Adds an event to the window's event queue. The event is accepted only if the window is open and shown|<span class="green-stable">stable</span>|
|void|clearEvents|Clears the window's event queue|<span class="green-stable">stable</span>|
|void|add|Adds an element to the window|<span class="green-stable">stable</span>|
|void|remove|Removes an element from the window|<span class="green-stable">stable</span>|
|void|clear|Removes all elements from the window|<span class="green-stable">stable</span>|
|bool|isOpen|Checks whether the window is open|<span class="green-stable">stable</span>|
|bool|isShow|Checks whether the window is shown|<span class="green-stable">stable</span>|
|bool|isFocused|Checks whether the system is currently focused on the window|<span class="green-stable">stable</span>|
|Uint32|getId|Returns the window identifier|<span class="green-stable">stable</span>|
|engine::Renderer*|getRenderer|Returns the window's renderer|<span class="green-stable">stable</span>|
|Size|getSize|Returns the window size|<span class="green-stable">stable</span>|
|std::string|getName|Returns the window name|<span class="green-stable">stable</span>|
|std::vector<const Event*>|getEvents|Returns a copy of the list of pointers to the window's events|<span class="yellow-stable">beta</span>|

## Event routing in tune()

* Events from the Guic queue are passed to the window with a matching `winId`. An event with `winId` 0 is passed to all windows.
* The `WindowResized` event changes the size of the window's root container.
* `MouseMoved` is passed to the element under the cursor. The window remembers this element as the last one the cursor worked with.
* Other mouse events (presses, releases, wheel) are passed to the element under the cursor.
* `MouseButtonClicked` is passed to an element only if the press and the release happened over the same element.
* Other events are passed to the window's root container through `control`.
* `WindowClosed` closes the window, unless `closeEventSkip()` was called.

The free functions for the event queue (`guic_send_event`, `config::guic_update_events`, `config::guic_poll_event`) are described on the [Functions](functions.md) page.
