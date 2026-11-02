# Creating a window

To use Guic, include the Guic.hpp header – it contains all the main definitions for working with the library.

```cpp
#include <Guic/Guic.hpp>
```

All elements live in the guic namespace, so for convenience we'll use `using`.

```cpp
using namespace guic;
```

Add the main function, and in it create a new window with the Window class, specifying its title and size. For the size we use the Guic class Size.

```cpp
int main() {
    Window window("What's your mood?", Size(640, 480));

    return 0;
}
```

A window is created closed at first, so we open it (it will be shown automatically when opened).

```cpp
window.open();
```

Guic does not manage the program loop, so we create the loop ourselves. The loop condition can check whether the window is open.

```cpp
while (window.isOpen()) {
    
}
```

The window has two functions for control – tune and display.
Tune processes incoming events and runs element logic, while display collects all changes and sends them for drawing.
Add them to the loop in a logical order – first the logic processing, then the drawing:

```cpp
window.tune();
window.display();
```

The loop eats as much CPU as it can get. To save resources, add a delay at the end of the loop:

```cpp
guic_delay(10);
```

## Final result
```cpp
#include <Guic/Guic.hpp>

using namespace guic;

int main() {
    Window window("What's your mood?", Size(640, 480));
    window.open();

    while (window.isOpen()) {
        window.tune();
        window.display();

        guic_delay(10);
    }

    return 0;
}

```

<div style="text-align: right;"><a class="md-button md-button--primary" href="../drawing_image/">Next step – Drawing an image</a></div>
