# Обработка событий

Для демонстрации обработки событий попробуем реализовать счётчик лайков.
Лайком будем считать нажатие картинки с котиком.
Для начала в глобальной переменной объявим сам счётчик

```cpp
int likes = 0;
```

Для обработки любых событий используется класс Trigger.
Укажем ту же область Rect для триггера, что и для нашей картинки.
Ну и укажем соответствующее скругление (Сделаем его кругом)

```cpp
Trigger like(Rect(100, 100, 140, 140));
like.setRadius(70);
```

Теперь самое сложное в Guic - для того, чтобы задать условие срабатывания триггера, необходимо использовать *лямбда-функцию*.
Лямбда-функция - это функция, которая состоит из трёх блоков:

* Квадратные скобки [] - используются для передачи внешних переменных.
Сюда мы добавлять ничего не будем, но если бы нам понадобилось обратиться к самому триггеру - мы бы написали [&trigger]

* Круглые скобки () - используются для передачи аргументов.
В Trigger можно либо оставить их пустыми, либо добавить константный указатель на событие.
Добавляем событие, потому что нам нужно отлавливать нажатие левой кнопки мыши

* Фигурные скобки {} - само тело функции. В неё мы сейчас и будем писать логику нажатия на левую кнопку мыши.

Теперь, когда мы примерно поняли, как этим пользоваться, добавляем условие нажатия.
* В [] не передаём ничего.
* В () добавляем указатель `const Event*` на событие.
* В {} добавляем тело функции, которая возвращает bool. Возврат bool обязателен, иначе код не скомпилируется.

```cpp
like.on([](const Event* event){
    
});
```

Теперь, когда придёт событие, нам нужно его проверить, поэтому в функцию on добавляем нашу логику срабатывания.

Нас интересует тип события "Клик кнопки мыши" и конкретная кнопка "Левая кнопка мыши".
Для отлова клика кнопки мыши, мы из event достаём тип события и сравниваем его с перечислением Event::EventType.
Для проверки, что это именно **левая** кнопка мыши, из event достаём data.click.key.

* *data - переменная, которая содержит данные в зависимости от типа события.
Если тип события "Мышка", то в event->data.key.key будет мусор.
В целом, порядок проверки не важен.
Потенциально опасно только чтение data.text, поэтому здесь проверку на тип события стоит проводить раньше, чем чтение data.text.

```cpp
if(event->type == Event::EventType::MouseButtonClicked && event->data.click.key == Key::LMB) {
    return true;
}

return false;
```

* Событие MouseButtonClicked обрабатывается только тем элементом, на который пользователь изначально кликнул.
Для вычисления такого элемента используется функция hit(x, y).
В таких событиях мы можем спокойно игнорировать видимую область,
т.к. клик мыши не сработает для спрятанного куда-то элемента

Ура. Мы написали этого монстра.
Его близнец bind принимает лямбда-функцию без аргументов или с указателем `const Event*`.
Здесь хватит версии без аргументов.
Ничего сложного нам не понадобится, просто прибавляем единицу к количеству лайков

```cpp
like.bind([](){
    likes++;
});
```

Добавляем в окно

```cpp
window.add(like);
```

*Вы чемпион!* Теперь, при нажатии на котика, количество лайков прибавляется.
Такое стоит отметить и добавить ещё одну кнопку - для сброса счётчика. Сначала добавим визуал:

```cpp
Sprite resetShape(Rect(450, 120, 140, 50), Color("#f4e1c1"));
resetShape.setRadius(25);

Text resetCaption(Rect(480, 135, 100, 30), "Сбросить", font);
resetCaption.setColor(Color("#1b4242"));
```

И теперь сам триггер. Т.к. Guic позиционирует себя, как *удобная* библиотека, используем готовую функцию onLMB()

```cpp
Trigger reset(Rect(450, 120, 140, 50));
reset.setRadius(25);
reset.onLMB([](){ likes = 0; });
```

*Важное уточнение - onLMB срабатывает на клик: кнопку нажали и отпустили над одним и тем же элементом - это стандарт для интерфейсов.*

Выведем количество лайков на экран и пока что спрячем текст. Отрисуем его, когда поставим первый лайк.

```cpp
Text total(Rect(450, 25, 280, 40), "Лайков сегодня: 0", font);
total.setColor(Color::White);
total.hide();
```

Добавляем всё вышеперечисленное в окно

```cpp
window.add(resetShape);
window.add(resetCaption);
window.add(reset);
window.add(total);
```

Перед циклом добавим переменную, которая будет хранить количество лайков, которое отображается в данный момент.
В самом цикле после tune() добавим условие, что если количество изменилось - меняем текст и показываем его

```cpp
int shown = 0;
while (window.isOpen()) {
    window.tune();

    if (likes != shown) {
        shown = likes;
        total.setString("Лайков сегодня: " + std::to_string(likes));
        total.show();
    }
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

    Sprite resetShape(Rect(450, 120, 140, 50), Color("#f4e1c1"));
    resetShape.setRadius(25);

    Text resetCaption(Rect(480, 135, 100, 30), "Сбросить", font);
    resetCaption.setColor(Color("#1b4242"));

    Trigger reset(Rect(450, 120, 140, 50));
    reset.setRadius(25);
    reset.onLMB([](){ likes = 0; });

    Text total(Rect(450, 25, 280, 40), "Лайков сегодня: 0", font);
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
            total.setString("Лайков сегодня: " + std::to_string(likes));
            total.show();
        }

        window.display();

        guic_delay(10);
    }

    return 0;
}
```

<div style="text-align: right;"><a class="md-button md-button--primary" href="../structuring/">Следующий шаг – Структурирование</a></div>
