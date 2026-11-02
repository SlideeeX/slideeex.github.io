# Вывод текста

Для того, чтобы вывести текст, нам понадобится шрифт. Перед картинкой создаём Guic-класс Font его с указанием файла и размером.

```cpp
Font font("UbuntuMono-Bold.ttf", 16);
```

Шрифт и текст используют UTF8, поэтому, чтобы не грузить весь шрифт целиком (Что вышло бы неприлично дорого в плане RAM),
добавляем готовые наборы символов, которые необходимо загрузить. Русского языка и знаков препинания пока достаточно

```cpp
font.addPack(Font::Pack::RU);
font.addPack(Font::Pack::Sign);
```

Теперь создаём текст через Guic-класс Text, указывая его область, строку с текстом и шрифт.

```cpp
Text title(Rect(25, 25, 580, 40), "Какой ты котик сегодня?", font);
```

По умолчанию цвет шрифта чёрный. Возьмём белый

```cpp
title.setColor(Color::White);
```

Добавляем

```cpp
window.add(title);
```

А теперь добавим ответ на этот вопрос. Расположим текст под картинкой с котиком - и на экране, и в коде.
Текст `"Нужен кофе и немного тишины..."` не влезет по ширине, т.к. картинка намного меньше.
Поэтому сами перенесём строки с помощью литералов `\n`

```cpp
Text coffee(Rect(100, 250, 140, 60), "Нужен кофе\nи немного\nтишины...", font);
coffee.setColor(Color::White);
window.add(coffee);
```

## Результат

```cpp
#include <Guic/Guic.hpp>

using namespace guic;

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

    Text coffee(Rect(100, 250, 140, 60), "Нужен кофе\nи немного\nтишины...", font);
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

<div style="text-align: right;"><a class="md-button md-button--primary" href="../handling_events/">Следующий шаг – Обработка событий</a></div>
