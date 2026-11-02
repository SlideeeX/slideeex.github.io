# Структурирование

Без структурирования UI был бы очень необычной диковинкой.
К счастью, Guic предоставляет инструмент для структурирования - Контейнер.
Он группирует элементы, передаёт им события, рисует их, управляет отображением...
В общем делает всё, чтобы не дублировать код для большого количества элементов

Создадим этого героя после добавления текста про кофе:

```cpp
Container container(Rect(450, 25, 280, 320));
```

Важное уточнение - отображение каждого элемента зависит от его родителя.
Добавляя элемент в контейнер, контейнер становится родителем.
В таком случае элемент будет обрезаться по его видимой области, а положение сдвинется относительно родительского.

Воспользуемся его особенностями - удалим из кода total.hide() и изменим позиции элементов в Rect

```cpp
Sprite resetShape(Rect(0, 95, 140, 50), Color("#f4e1c1"));
resetShape.setRadius(25);

Text resetCaption(Rect(30, 110, 100, 30), "Сбросить", font);
resetCaption.setColor(Color("#1b4242"));

Trigger reset(Rect(0, 95, 140, 50));
reset.setRadius(25);
reset.onLMB([](){ likes = 0; });

Text total(Rect(0, 0, 280, 40), "Лайков сегодня: 0", font);
total.setColor(Color::White);
```

Сейчас мы изменим логику показа счётчика.
Теперь и кнопка, и количество лайков будут отображаться только если пользователь нажал на котика.
Добавляем все элементы в контейнер, контейнер прячем, а самого добавляем в окно:

```cpp
container.add(resetShape);
container.add(resetCaption);
container.add(reset);
container.add(total);
container.hide();

window.add(container);
```

А вместо функции показа счётчика, теперь будем показывать контейнер

```cpp
container.show();
```

## Результат

```cpp
#include <Guic/Guic.hpp>

using namespace guic;

int likes = 0;

int main() {
    Window window("Как настроение?", Size(640, 480));
    window.open();

    Sprite background(Rect(0, 0, 640, 480), Color("#1b4242"));
    window.add(background);

    Font font("UbuntuMono-Bold.ttf", 16);
    font.addPack(Font::Pack::RU);
    font.addPack(Font::Pack::Sign);

    Text title(Rect(25, 25, 580, 40), "Какой ты котик сегодня?", font);
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

    Text coffee(Rect(100, 250, 140, 60), "Нужен кофе\nи немного\nтишины...", font);
    coffee.setColor(Color::White);
    window.add(coffee);

    Container container(Rect(450, 25, 280, 320));

    Sprite resetShape(Rect(0, 95, 140, 50), Color("#f4e1c1"));
    resetShape.setRadius(25);

    Text resetCaption(Rect(30, 110, 100, 30), "Сбросить", font);
    resetCaption.setColor(Color("#1b4242"));

    Trigger reset(Rect(0, 95, 140, 50));
    reset.setRadius(25);
    reset.onLMB([](){ likes = 0; });

    Text total(Rect(0, 0, 280, 40), "Лайков сегодня: 0", font);
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
            total.setString("Лайков сегодня: " + std::to_string(likes));
            container.show();
        }

        window.display();

        guic_delay(10);
    }

    return 0;
}
```

<div style="text-align: right;"><a class="md-button md-button--primary" href="../custom_element/">Следующий шаг – Свой элемент</a></div>
