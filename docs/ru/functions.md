# guic::Functions
Файл объявляет свободные функции Guic. Полей и методов нет. <span class="green-stable">stable</span>

## Функции в namespace guic

* `void guic_delay(Uint32 mls)` - Приостанавливает выполнение на `mls` миллисекунд
* `Position guic_get_mouse_pos()` - Возвращает текущую позицию курсора мыши
* `void guic_send_event(Event*& event)` - Ставит событие в очередь Guic. Если `event` равен `nullptr`, ничего не происходит. Иначе Guic забирает владение событием и обнуляет указатель `event`. Событие станет доступно через `config::guic_poll_event()` после следующего `config::guic_update_events()` <span class="green-stable">stable</span>

## Функции в namespace guic::config

* `bool guic_init()` - Инициализирует Guic. Возвращает `true` при успешной инициализации. Повторный вызов, когда Guic уже инициализирован, ничего не делает и тоже возвращает `true`. Возвращает `false`, если не удалось инициализировать SDL или TTF
* `bool guic_quit()` - Завершает работу Guic. Возвращает `true` при успешном завершении, `false` - если Guic не был инициализирован
* `void guic_update_events()` - Удаляет события предыдущего пакета и забирает новый пакет: события из системы и события, переданные через `guic_send_event`. Указатели, полученные из `guic_poll_event()` до этого вызова, становятся недействительными <span class="green-stable">stable</span>
* `const Event* guic_poll_event()` - Возвращает следующее событие текущего пакета или `nullptr`, если события закончились. Событие принадлежит Guic и действительно до следующего `guic_update_events()` <span class="green-stable">stable</span>

Обычно события обрабатывает [Window](window.md) в методе `tune()`, и приложению эти функции напрямую не нужны.
