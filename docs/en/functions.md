# guic::Functions
The file declares Guic's free functions. It has no fields or methods. <span class="green-stable">stable</span>

## Functions in namespace guic

* `void guic_delay(Uint32 mls)` - Suspends execution for `mls` milliseconds
* `Position guic_get_mouse_pos()` - Returns the current position of the mouse cursor
* `void guic_send_event(Event*& event)` - Puts an event into the Guic queue. If `event` is `nullptr`, nothing happens. Otherwise Guic takes ownership of the event and sets the pointer `event` to `nullptr`. The event becomes available through `config::guic_poll_event()` after the next `config::guic_update_events()` <span class="green-stable">stable</span>

## Functions in namespace guic::config

* `bool guic_init()` - Initializes Guic. Returns `true` on successful initialization. A repeated call while Guic is already initialized does nothing and also returns `true`. Returns `false` if SDL or TTF could not be initialized
* `bool guic_quit()` - Shuts down Guic. Returns `true` on successful shutdown, `false` if Guic was not initialized
* `void guic_update_events()` - Removes the events of the previous batch and fetches a new batch: events from the system and events passed through `guic_send_event`. Pointers obtained from `guic_poll_event()` before this call become invalid <span class="green-stable">stable</span>
* `const Event* guic_poll_event()` - Returns the next event of the current batch, or `nullptr` if the events have run out. The event belongs to Guic and is valid until the next `guic_update_events()` <span class="green-stable">stable</span>

Usually events are handled by [Window](window.md) in the `tune()` method, and the application does not need these functions directly.
