# Structuring

Without structuring, a UI would be a very unusual curiosity.
Fortunately, Guic provides a tool for structuring - the Container.
It groups elements, passes events to them, draws them, manages their display...
In short, it does everything so that you do not duplicate code for a large number of elements

Let's create this hero after adding the text about coffee:

```cpp
Container container(Rect(450, 25, 280, 320));
```

An important clarification - the display of each element depends on its parent.
When you add an element to a container, the container becomes its parent.
In that case the element is clipped to its visible area, and its position is shifted relative to the parent.

Let's use this feature - remove total.hide() from the code and change the positions of the elements in Rect

```cpp
Sprite resetShape(Rect(0, 95, 140, 50), Color("#f4e1c1"));
resetShape.setRadius(25);

Text resetCaption(Rect(30, 110, 100, 30), "Reset", font);
resetCaption.setColor(Color("#1b4242"));

Trigger reset(Rect(0, 95, 140, 50));
reset.setRadius(25);
reset.onLMB([](){ likes = 0; });

Text total(Rect(0, 0, 280, 40), "Likes today: 0", font);
total.setColor(Color::White);
```

Now we change the logic of showing the counter.
From now on, both the button and the number of likes will be displayed only if the user has clicked the cat.
Add all the elements to the container, hide the container, and add the container itself to the window:

```cpp
container.add(resetShape);
container.add(resetCaption);
container.add(reset);
container.add(total);
container.hide();

window.add(container);
```

And instead of the function that showed the counter, we will now show the container

```cpp
container.show();
```

## Result

```cpp
#include <Guic/Guic.hpp>

using namespace guic;

int likes = 0;

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

    Trigger like(Rect(100, 100, 140, 140));
    like.setRadius(70);
    like.on([](const Event* event){
        if(event->type == Event::EventType::MouseButtonClicked && event->data.click.key == Key::LMB) {
            return true;
        }

        return false;
    });
    like.bind([](){
        likes++;
    });
    window.add(like);

    Text coffee(Rect(100, 250, 140, 60), "Need coffee\nand a little\nquiet...", font);
    coffee.setColor(Color::White);
    window.add(coffee);

    Container container(Rect(450, 25, 280, 320));

    Sprite resetShape(Rect(0, 95, 140, 50), Color("#f4e1c1"));
    resetShape.setRadius(25);

    Text resetCaption(Rect(30, 110, 100, 30), "Reset", font);
    resetCaption.setColor(Color("#1b4242"));

    Trigger reset(Rect(0, 95, 140, 50));
    reset.setRadius(25);
    reset.onLMB([](){ likes = 0; });

    Text total(Rect(0, 0, 280, 40), "Likes today: 0", font);
    total.setColor(Color::White);

    container.add(resetShape);
    container.add(resetCaption);
    container.add(reset);
    container.add(total);
    container.hide();

    window.add(container);

    int shown = 0;
    while (window.isOpen()) {
        window.tune();

        if (likes != shown) {
            shown = likes;
            total.setString("Likes today: " + std::to_string(likes));
            container.show();
        }

        window.display();

        guic_delay(10);
    }

    return 0;
}
```

<div style="text-align: right;"><a class="md-button md-button--primary" href="../custom_element/">Next step – Custom element</a></div>
