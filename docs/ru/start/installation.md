# Установка

## Установка на Code::Blocks для Windows

Создаёте новый проект.
В папку с проектом (Или в удобное для вас место) добавьте папку Guic.
В неё из папки MinGW/x64 скопируйте папки bin, include и lib.

В Project -> Build Options -> Linker settings в "Link libraries" добавьте "guic" без кавычек.
Здесь же в "Search directiories" в "Compiler" укажите путь к Guic/include. В "Linker" укажите путь к Guic/lib.
В папку, где будет лежать .exe, добавьте guic.dll.

Для статической линковки используйте libguic-s.a.

Для использования библиотеки в коде используйте заголовочный файл Guic.hpp.

## Установка на Code::Blocks для Linux

Создаёте новый проект.
В папку с проектом (Или в удобное для вас место) добавьте папку Guic.
В неё из папки Linux/x64 скопируйте папки bin, include и lib.

В Project -> Build Options -> Linker settings в "Link libraries" добавьте "guic" без кавычек.
Здесь же в "Search directiories" в "Compiler" укажите путь к Guic/include. В "Linker" укажите путь к Guic/bin.
В папку, где будет лежать исполняемый файл, добавьте libguic.so.

Для статической линковки используйте libguic.a.

Для подключения всей библиотеки используйте заголовочный файл Guic.hpp.