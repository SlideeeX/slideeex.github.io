# Drawing text

To draw text, we need a font. Before the image, we create the Guic class Font, specifying the file and the size.

```cpp
Font font("UbuntuMono-Bold.ttf", 16);
```

Fonts and text use UTF8, so, to avoid loading the whole font (which would be unreasonably expensive in RAM),
we add the ready-made character sets that need to be loaded. For now, Russian and punctuation are enough

```cpp
font.addPack(Font::Pack::RU);
font.addPack(Font::Pack::Sign);
```

Now create the text through the Guic class Text, specifying its area, the string and the font.

```cpp
Text title(Rect(25, 25, 580, 40), "What kind of cat are you today?", font);
```

By default the font color is black. Let's take white

```cpp
title.setColor(Color::White);
```

Add it

```cpp
window.add(title);
```

Now let's add an answer to this question. We place the text under the picture of the cat - both on screen and in the code.
The text `"Need coffee and a little quiet..."` will not fit in width, because the picture is much smaller.
So we break the lines ourselves using `\n` literals

```cpp
Text coffee(Rect(100, 250, 140, 60), "Need coffee\nand a little\nquiet...", font);
coffee.setColor(Color::White);
window.add(coffee);
```

## Result

```cpp
#include <Guic/Guic.hpp>

using namespace guic;

int main() {
    Window window("What's your mood?", Size(640, 480));
    window.open();

    Sprite background(Rect(0, 0, 640, 480), Color("#1b4242"));
    window.add(background);

    Font font("UbuntuMono-Bold.ttf", 16);
    font.addPack(Font::Pack::RU);
    font.addPack(Font::Pack::Sign);

    Text title(Rect(25, 25, 580, 40), "What kind of cat are you today?", font);
    title.setColor(Color::White);
    window.add(title);

    Image picture("kit.png");
    Sprite photo(Rect(100, 100, 140, 140), picture);
    photo.setRadius(70);
    window.add(photo);

    Text coffee(Rect(100, 250, 140, 60), "Need coffee\nand a little\nquiet...", font);
    coffee.setColor(Color::White);
    window.add(coffee);

    while (window.isOpen()) {
        window.tune();
        window.display();

        guic_delay(10);
    }

    return 0;
}
```

<div style="text-align: right;"><a class="md-button md-button--primary" href="../handling_events/">Next step – Handling events</a></div>
