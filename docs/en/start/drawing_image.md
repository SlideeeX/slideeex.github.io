# Drawing an image

To draw an image, we can take the code from the previous step.

A picture is created with the Sprite class. When creating it, we specify its Rect - the rectangle of the area,
where x and y are the coordinates of the sprite, and width and height are its size.
The second parameter is the sea-wave color, set through the Guic class Color

```cpp
Sprite background(Rect(0, 0, 640, 480), Color("#1b4242"));
```

To display the sprite, we need to add it to the Window
(The same element cannot be added to different windows - it will be moved instead)

```cpp
window.add(background);
```

Now we can compile the code and see that the sea-wave background is set.
If we try to stretch the window, the areas on the right and at the bottom will stay empty,
because our background is designed for a 640x480 window, and it is not drawn beyond that

But a colored rectangle is not enough - we can display an image.
The Image class does not store the image itself, so it will be loaded into the program automatically when needed.
This behavior is typical of any resource class.

Create an Image

```cpp
Image picture("kit.png");
```

Now create a Sprite, move it a little, but instead of the sea-wave color, specify our image

```cpp
Sprite photo(Rect(100, 100, 140, 140), picture);
```

And for good measure, turn it into a circle. Our sprite is 140 wide. So the circle's diameter will also be 140. Therefore we divide the diameter by 2 and get the needed radius of 70

```cpp
photo.setRadius(70);
```

Add the sprite and keep in mind - now picture cannot be deleted. First it must be unloaded through the renderer: `window.getRenderer()->unload(picture);`. If you skip this, the image will stay in video memory.

```cpp
window.add(photo);
```

## Final result
```cpp
#include <Guic/Guic.hpp>

using namespace guic;

int main() {
    Window window("What's your mood?", Size(640, 480));
    window.open();

    Sprite background(Rect(0, 0, 640, 480), Color("#1b4242"));
    window.add(background);

    Image picture("kit.png");
    Sprite photo(Rect(100, 100, 140, 140), picture);
    photo.setRadius(70);
    window.add(photo);

    while (window.isOpen()) {
        window.tune();
        window.display();

        guic_delay(10);
    }

    return 0;
}
```

<div style="text-align: right;"><a class="md-button md-button--primary" href="../drawing_text/">Next step – Drawing text</a></div>
