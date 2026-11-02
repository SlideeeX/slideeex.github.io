# Handling events

To demonstrate event handling, let's implement a like counter.
We will count a click on the picture of the cat as a like.
To begin with, declare the counter itself in a global variable

```cpp
int likes = 0;
```

To handle any events, the Trigger class is used.
Specify the same Rect area for the trigger as for our picture.
And specify the matching rounding (make it a circle)

```cpp
Trigger like(Rect(100, 100, 140, 140));
like.setRadius(70);
```

Now the hardest part in Guic - to set the activation condition of the trigger, you need to use a *lambda function*.
A lambda function is a function made of three blocks:

* Square brackets [] - used to pass external variables.
We won't add anything here, but if we needed to access the trigger itself, we would write [&trigger]

* Round brackets () - used to pass arguments.
In Trigger you can either leave them empty, or add a constant pointer to an event.
We add the event, because we need to catch a left mouse button press

* Curly braces {} - the function body itself. This is where we will write the logic of the left mouse button press.

Now that we roughly understand how to use it, let's add the activation condition.
* Nothing is passed in [].
* In () we add a `const Event*` pointer to the event.
* In {} we add the function body, which returns bool. Returning bool is mandatory, otherwise the code will not compile.

```cpp
like.on([](const Event* event){
    
});
```

Now, when an event arrives, we need to check it, so we add our activation logic into the on function.

We are interested in the event type "mouse button click" and the specific button "left mouse button".
To catch a mouse button click, we take the event type from event and compare it with the Event::EventType enumeration.
To check that it is specifically the **left** mouse button, we take data.click.key from event.

* *data is a variable that holds data depending on the event type.
If the event type is "mouse", then event->data.key.key contains garbage.
In general the order of the checks does not matter.
Only reading data.text is potentially dangerous, so the event type check should be done before reading data.text.

```cpp
if(event->type == Event::EventType::MouseButtonClicked && event->data.click.key == Key::LMB) {
    return true;
}

return false;
```

* A MouseButtonClicked event is handled only by the element that the user originally clicked.
To find such an element, the function hit(x, y) is used.
For such events we can safely ignore the visible area,
because a mouse click will not trigger for an element that is hidden somewhere

Hooray. We have written this monster.
Its twin, bind, accepts a lambda function with no arguments or with a `const Event*` pointer.
The version without arguments is enough here.
Nothing complicated is needed, we just add one to the number of likes

```cpp
like.bind([](){
    likes++;
});
```

Add it to the window

```cpp
window.add(like);
```

*You're a champion!* Now, when the cat is clicked, the number of likes increases.
This deserves a mark, and we add one more button - to reset the counter. First, the visuals:

```cpp
Sprite resetShape(Rect(450, 120, 140, 50), Color("#f4e1c1"));
resetShape.setRadius(25);

Text resetCaption(Rect(480, 135, 100, 30), "Reset", font);
resetCaption.setColor(Color("#1b4242"));
```

And now the trigger itself. Because Guic positions itself as a *convenient* library, we use the ready-made onLMB() function

```cpp
Trigger reset(Rect(450, 120, 140, 50));
reset.setRadius(25);
reset.onLMB([](){ likes = 0; });
```

*An important clarification - onLMB fires on a click: the button was pressed and released over the same element - this is the standard for interfaces.*

Let's display the number of likes on screen and hide the text for now. We will draw it when the first like is set.

```cpp
Text total(Rect(450, 25, 280, 40), "Likes today: 0", font);
total.setColor(Color::White);
total.hide();
```

Add all of the above to the window

```cpp
window.add(resetShape);
window.add(resetCaption);
window.add(reset);
window.add(total);
```

Before the loop, add a variable that will store the number of likes currently displayed.
In the loop itself, after tune(), add a condition: if the number has changed, update the text and show it

```cpp
int shown = 0;
while (window.isOpen()) {
    window.tune();

    if (likes != shown) {
        shown = likes;
        total.setString("Likes today: " + std::to_string(likes));
        total.show();
    }
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

    Sprite resetShape(Rect(450, 120, 140, 50), Color("#f4e1c1"));
    resetShape.setRadius(25);

    Text resetCaption(Rect(480, 135, 100, 30), "Reset", font);
    resetCaption.setColor(Color("#1b4242"));

    Trigger reset(Rect(450, 120, 140, 50));
    reset.setRadius(25);
    reset.onLMB([](){ likes = 0; });

    Text total(Rect(450, 25, 280, 40), "Likes today: 0", font);
    total.setColor(Color::White);
    total.hide();

    window.add(resetShape);
    window.add(resetCaption);
    window.add(reset);
    window.add(total);

    int shown = 0;
    while (window.isOpen()) {
        window.tune();

        if (likes != shown) {
            shown = likes;
            total.setString("Likes today: " + std::to_string(likes));
            total.show();
        }

        window.display();

        guic_delay(10);
    }

    return 0;
}
```

<div style="text-align: right;"><a class="md-button md-button--primary" href="../structuring/">Next step – Structuring</a></div>
