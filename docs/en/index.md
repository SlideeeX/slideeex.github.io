<h2 style="text-align: center;">What is Guic</h2>

Guic (Graphical User Interface Creator) is a library for building graphical user interfaces. Its purpose is to make interface creation easier for software: no need to deploy heavy frameworks, memorize graphics libraries, or study the one right architectural approach.

Guic runs on the SDL engine, which makes it suitable for production: the interface won't lag from a couple of images. The library is distributed under the LGPL-3.0 license with an exception (see the distribution for details), so you can develop commercial software with a clear conscience.

Guic stands out with an intuitive base of primitive elements. The interface is assembled like a constructor: simple elements form full-fledged components with their own logic, and those components form an interface of any complexity. It grows step by step, from a simple application background and a selection menu to complex composite structures. Built-in tools help development by applying common interface patterns.

An interface needs a loop to be displayed, but Guic won't make you spend long thinking about how to fill it. User-interaction elements can take passed lambda functions, which makes it possible to attach functionality outside the main loop.

Want your own `Resource`, `Event` or `Element`? You can extend the library. The engine handles everything you expose in the `public` and `protected` interface of your derived class.

<div style="text-align: center;"><a class="md-button md-button--primary" href="start/creating_window/">Let's get started</a></div>
