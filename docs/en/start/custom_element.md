# Custom element

Containers are great!
But if this goes on, our main will be as tall as the Eiffel Tower.
Guic has a tool that suits us - the *Composite*.
In essence, a Composite is a bundle of several elements into one more complex element.
It can have its own logic and drawing, but the idea is always the same - tie elements together into one node.

The "Reset" button practically begs to become a new composite, so we start with it.
Create a class "ResetButton" and inherit from the Composite element.
The constructor takes a Rect and a font.

* Note - we pass the font by reference.
Font is a descendant of Resource, and copying a Resource is forbidden. So passing the font by value (`Font font`) will cause a compilation error.

```cpp
class ResetButton : public Composite {
public:
    ResetButton(Rect rect, Font& font) : Composite(rect) {
        
    }
private:
    
};
```

The "Reset" button consists of a background, a text and a trigger.
Move all these elements from main into private:

```cpp
Sprite resetShape;
Text resetCaption;
Trigger reset;
```

Now they need to be initialized in the constructor.
Again we change the positions of the elements, neatly adjusting their appearance.

```cpp
resetShape.setRect(Rect(0, 0, 140, 50));
resetShape.setColor(Color("#f4e1c1"));
resetShape.setRadius(25);

resetCaption.setRect(Rect(35, 16, 100, 30));
resetCaption.setString("Reset");
resetCaption.setFont(font);
resetCaption.setColor(Color("#1b4242"));

reset.setRect(Rect(0, 0, 140, 50));
reset.setRadius(25);
reset.onLMB([](){ likes = 0; });
```

Now we need to give Guic the ability to manage these elements.
We will use add - the element is added to the composite's own container and is managed automatically.
Add them at the end of the constructor, and do not forget the order: Background -> Caption -> Trigger

```cpp
add(resetShape);
add(resetCaption);
add(reset);
```

Everything is ready. Now we have a fully working "Reset button" element.
Let's create it in main, before the likes counter text, and add it to our window

```cpp
ResetButton resetButton(Rect(460, 400, 140, 50), font);
window.add(resetButton);
```

Now let's remove the old code from the previous step from main: the `container` together with its elements (`resetShape`, `resetCaption`, `reset`, `total`) and the call `container.show()` in the loop. Otherwise the reset button will appear twice.

The counter now lies directly in the window again, in the top-left corner:

```cpp
Text total(Rect(25, 40, 280, 40), "Likes today: 0", font);
total.setColor(Color::White);
window.add(total);
```

In the loop we remove `container.show()` - only the update of the counter text remains.

We remove the picture of the cat, the trigger and the "Need coffee" text from main - they will be replaced by a mood card.
This looks like a foretaste of the mood card! We create a class MoodCard.
It will take a picture, a font and the mood description.
Do not forget to pass resources by reference.
The mood description will be const, so that we can pass "text as strings"

```cpp
class MoodCard : public Composite {
public:
    MoodCard(Rect rect, Image& picture, Font& font, const std::string& mood) : Composite(rect) {
        
    }

private:
    
};
```

We pull our elements out of main and add them to private.
We will also add a "Background" sprite here, so the card looks nicer

```cpp
Sprite background;
Sprite photo;
Text caption;
Trigger heart;
```

We initialize our elements, except, for now, the trigger:

```cpp
background.setRect(Rect(0, 0, rect.width, rect.height));
background.setColor(Color("#f4e1c1"));
background.setRadius(36);

photo.setRect(Rect(20, 20, 140, 140));
photo.setImage(picture);
photo.setRadius(70);

caption.setRect(Rect(20, 170, 140, 50));
caption.setString(mood);
caption.setFont(font);
caption.setColor(Color("#1b4242"));
```

The trigger must add the number of presses to the likes counter.
Besides, the code above shifted the cards so that they overlap each other.
This can get in the way of seeing the text, so when the cat is clicked, we will bring the element to the top.

In Guic, the elements above are determined either by the drawing order or by layers.
Elements in a container are drawn in the order they were added, so we can simply re-add the element.
Let's create a pointer to it in private and a function to fill it.

```cpp
void setContainer(Container &container) {
    this->container = &container;
}

private:
    Container* container = nullptr;
```

* P.S. Giving elements access to their parents is not recommended - starting with the fact that an element can end up in an infinite loop,
and ending with undefined behavior of Guic. So far nothing like this has been noticed (except for the UNSTABLE members of the classes),
but in serious projects it is better to avoid such a design.

Now we can initialize the trigger itself

```cpp
heart.setRect(Rect(20, 20, 140, 140));
heart.setRadius(70);
heart.onLMB([this] {
    likes++;
    if(container == nullptr) return; // Just in case
    container->remove(*this);
    container->add(*this);
});
```

Hand control over to the composite

```cpp
add(background);
add(photo);
add(caption);
add(heart);
```

The element is ready! Now we can use them in main.
Before the reset button, we create our card elements, create a container for them, add the cards to it, and put the container into the window.
Do not forget to call our function that sets the card's container.

```cpp
MoodCard happy(Rect(0, 0, 180, 230), picture, font, "Feeling bright,\nlike morning tea");
MoodCard tired(Rect(150, 0, 180, 230), picture, font, "A bit tired,\nbut holding on");
MoodCard coffee(Rect(300, 0, 180, 230), picture, font, "Need coffee\nand some quiet");

Container cards(Rect(30, 110, 580, 230));

cards.add(happy);
happy.setContainer(cards);

cards.add(tired);
tired.setContainer(cards);

cards.add(coffee);
coffee.setContainer(cards);

window.add(cards);
```

* P.S. You can override some functions of a composite to hook into their logic.
You can see the list of virtual functions on the Composite page.

* P.S.S. So far we have covered only the method of creating an element through add() - adding an element to the container inside it.
The composite, in turn, proxies virtual functions to it. But there is a second way - by adding elements
through the adopt and release methods, you bind them to the composite bypassing the container. In that case, you must
check ALL virtual methods of the composite and add logic to them if needed.

In the end, main puts everything together: three cards in the `cards` container, the `ResetButton` reset button and the likes counter in the top-left corner.

```cpp
#include <Guic/Guic.hpp>

using namespace guic;

int likes = 0;

class ResetButton : public Composite {
public:
    ResetButton(Rect rect, Font& font) : Composite(rect) {
        resetShape.setRect(Rect(0, 0, 140, 50));
        resetShape.setColor(Color("#f4e1c1"));
        resetShape.setRadius(25);

        resetCaption.setRect(Rect(35, 16, 100, 30));
        resetCaption.setString("Reset");
        resetCaption.setFont(font);
        resetCaption.setColor(Color("#1b4242"));

        reset.setRect(Rect(0, 0, 140, 50));
        reset.setRadius(25);
        reset.onLMB([](){ likes = 0; });

        add(resetShape);
        add(resetCaption);
        add(reset);
    }
private:
    Sprite resetShape;
    Text resetCaption;
    Trigger reset;
};

class MoodCard : public Composite {
public:
    MoodCard(Rect rect, Image& picture, Font& font, const std::string& mood) : Composite(rect) {
        background.setRect(Rect(0, 0, rect.width, rect.height));
        background.setColor(Color("#f4e1c1"));
        background.setRadius(36);

        photo.setRect(Rect(20, 20, 140, 140));
        photo.setImage(picture);
        photo.setRadius(70);

        caption.setRect(Rect(20, 170, 140, 50));
        caption.setString(mood);
        caption.setFont(font);
        caption.setColor(Color("#1b4242"));

        heart.setRect(Rect(20, 20, 140, 140));
        heart.setRadius(70);
        heart.onLMB([this] {
            likes++;
            if(container == nullptr) return;
            container->remove(*this);
            container->add(*this);
        });

        add(background);
        add(photo);
        add(caption);
        add(heart);
    }

    void setContainer(Container &container) {
        this->container = &container;
    }

    Container* container = nullptr;

private:
    Sprite background;
    Sprite photo;
    Text caption;
    Trigger heart;
};

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

    MoodCard happy(Rect(0, 0, 180, 230), picture, font, "Feeling bright,\nlike morning tea");
    MoodCard tired(Rect(150, 0, 180, 230), picture, font, "A bit tired,\nbut holding on");
    MoodCard coffee(Rect(300, 0, 180, 230), picture, font, "Need coffee\nand some quiet");

    Container cards(Rect(30, 110, 580, 230));

    cards.add(happy);
    happy.setContainer(cards);

    cards.add(tired);
    tired.setContainer(cards);

    cards.add(coffee);
    coffee.setContainer(cards);

    window.add(cards);

    ResetButton resetButton(Rect(460, 400, 140, 50), font);
    window.add(resetButton);

    Text total(Rect(25, 40, 280, 40), "Likes today: 0", font);
    total.setColor(Color::White);
    window.add(total);

    int shown = 0;
    while (window.isOpen()) {
        window.tune();

        if (likes != shown) {
            shown = likes;
            total.setString("Likes today: " + std::to_string(likes));
        }

        window.display();

        guic_delay(10);
    }

    return 0;
}
```
