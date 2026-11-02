# Свой элемент

Контейнеры - это конечно хорошо!
Но если так продолжится, наш main будет высотой с Эйфелеву башню.
У Guic есть подходящий нам инструмент - *Композит*.
По своей сути Композит - это связка нескольких элементов в один более сложный.
У него может быть своя логика, отрисовка, но суть всегда одна - связать элементы в один узел.

Кнопка "Сбросить" сама напрашивается стать новым композитом, с неё и начнём.
Создаём класс "ResetButton" и наследуемся от элемента Composite.
В конструктор передаём Rect и шрифт.

* Обратите внимание - шрифт мы передаём по ссылке.
Font это наследник Resource, а копирование Resource запрещено. Поэтому передача шрифта по значению (`Font font`) выдаст ошибку компиляции.

```cpp
class ResetButton : public Composite {
public:
    ResetButton(Rect rect, Font& font) : Composite(rect) {
        
    }
private:
    
};
```

Кнопка "Сбросить" у нас состоит из фона, текста и триггера.
Перетаскиваем все эти элементы из main в private:

```cpp
Sprite resetShape;
Text resetCaption;
Trigger reset;
```

Теперь их нужно инициализировать в конструкторе.
Снова меняем положение элементов, красиво подгоняя их внешний вид.

```cpp
resetShape.setRect(Rect(0, 0, 140, 50));
resetShape.setColor(Color("#f4e1c1"));
resetShape.setRadius(25);

resetCaption.setRect(Rect(35, 16, 100, 30));
resetCaption.setString("Сбросить");
resetCaption.setFont(font);
resetCaption.setColor(Color("#1b4242"));

reset.setRect(Rect(0, 0, 140, 50));
reset.setRadius(25);
reset.onLMB([](){ likes = 0; });
```

Теперь нужно дать Guic возможность управлять этими элементами.
Мы будем использовать add - элемент добавляется в собственный контейнер композита и управляется автоматически.
Добавляем их в конце конструктора, не забываем про порядок: Фон -> Заголовок -> Триггер

```cpp
add(resetShape);
add(resetCaption);
add(reset);
```

Всё готово. Теперь у нас есть полностью работающий элемент "Кнопка сброса".
Создадим его в main перед текстом счётчика лайков и добавим в наше окно

```cpp
ResetButton resetButton(Rect(460, 400, 140, 50), font);
window.add(resetButton);
```

Теперь уберём из main старый код из предыдущего шага: контейнер `container` вместе с его элементами (`resetShape`, `resetCaption`, `reset`, `total`) и вызов `container.show()` в цикле. Иначе кнопка сброса появится дважды.

Счётчик теперь снова лежит прямо в окне, в левом верхнем углу:

```cpp
Text total(Rect(25, 40, 280, 40), "Лайков сегодня: 0", font);
total.setColor(Color::White);
window.add(total);
```

В цикле убираем `container.show()` - остаётся только обновление текста счётчика.

Картинку котика, триггер и текст "Нужен кофе" из main удаляем - их заменит карточка настроения.
Кажется, это задаток для карточки настроения! Создаём класс MoodCard.
Он будет принимать картинку, шрифт и описание настроения.
Не забываем передавать ресурсы по ссылке.
Описание настроения сделаем const, чтобы передавать "текст в виде строк"

```cpp
class MoodCard : public Composite {
public:
    MoodCard(Rect rect, Image& picture, Font& font, const std::string& mood) : Composite(rect) {
        
    }

private:
    
};
```

Вытаскиваем наши элементы из main и добавляем их в private.
Сюда же добавим спрайт "Фон", чтобы карточка выглядела красивее

```cpp
Sprite background;
Sprite photo;
Text caption;
Trigger heart;
```

Инициализируем наши элементы кроме, пока что, триггера:

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

Триггер должен прибавлять количество нажатий к счётчику лайков.
К тому же, кодом выше мы сдвинули карточки так, что они друг на друга наслаиваются.
Это может мешать видеть текст, поэтому при нажатии на котика, мы будем выводить элемент повыше.

У Guic элементы выше определяются либо с помощью порядка отрисовки, либо с помощью слоёв.
Элементы в контейнере рисуются в порядке добавления, так что мы можем просто передобавить элемент.
Создадим на него указатель в private и функцию для его заполнения.

```cpp
void setContainer(Container &container) {
    this->container = &container;
}

private:
    Container* container = nullptr;
```

* P.S. Давать элементам доступ к родителям не рекомендуется - начиная с того, что элемент может уйти в бесконечный цикл,
заканчивая неопределённым поведением Guic. Пока что ничего подобного замечено не было (Исключая UNSTABLE-члены классов),
но в серьёзных проектах такого построения лучше избегать.

Теперь мы можем инициализировать сам триггер

```cpp
heart.setRect(Rect(20, 20, 140, 140));
heart.setRadius(70);
heart.onLMB([this] {
    likes++;
    if(container == nullptr) return; // На всякий случай
    container->remove(*this);
    container->add(*this);
});
```

Отдаём управление композиту

```cpp
add(background);
add(photo);
add(caption);
add(heart);
```

Элемент готов! Теперь мы можем их использовать в main.
Перед кнопкой сброса создаём наши элементы-карточки, создадим для них контейнер, добавим в него карточки, а его засунем в окно.
Не забываем вызывать нашу функцию для установки контейнера карточки.

```cpp
MoodCard happy(Rect(0, 0, 180, 230), picture, font, "Сегодня бодрый,\nкак утренний чай");
MoodCard tired(Rect(150, 0, 180, 230), picture, font, "Немного устал,\nно держусь");
MoodCard coffee(Rect(300, 0, 180, 230), picture, font, "Нужен кофе\nи немного тишины");

Container cards(Rect(30, 110, 580, 230));

cards.add(happy);
happy.setContainer(cards);

cards.add(tired);
tired.setContainer(cards);

cards.add(coffee);
coffee.setContainer(cards);

window.add(cards);
```

* P.S. Вы можете переопределять некоторые функции композита, чтобы внедряться в их логику.
Со списком виртуальных функций вы можете ознакомиться на странице Композита

* P.S.S. Мы разобрали только метод создания элемента через add() - добавления элемента в контейнер внутри.
Композит в свою очередь проксирует виртуальные функции на него. Но есть второй способ - добавляя элементы
через методы adopt и release, вы привязываете их к композиту в обход контейнера. Таким образом, вам необходимо
проверить ВСЕ виртуальные методы композита и добавить им логику при необходимости.

В итоге main собирает всё вместе: три карточки в контейнере `cards`, кнопка сброса `ResetButton` и счётчик лайков в левом верхнем углу.

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
        resetCaption.setString("Сбросить");
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

    MoodCard happy(Rect(0, 0, 180, 230), picture, font, "Сегодня бодрый,\nкак утренний чай");
    MoodCard tired(Rect(150, 0, 180, 230), picture, font, "Немного устал,\nно держусь");
    MoodCard coffee(Rect(300, 0, 180, 230), picture, font, "Нужен кофе\nи немного тишины");

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

    Text total(Rect(25, 40, 280, 40), "Лайков сегодня: 0", font);
    total.setColor(Color::White);
    window.add(total);

    int shown = 0;
    while (window.isOpen()) {
        window.tune();

        if (likes != shown) {
            shown = likes;
            total.setString("Лайков сегодня: " + std::to_string(likes));
        }

        window.display();

        guic_delay(10);
    }

    return 0;
}
```
