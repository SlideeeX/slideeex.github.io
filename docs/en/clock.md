# guic::Clock
A timer class – measures time in milliseconds using a monotonic clock and lets you start, stop and "lap" the timer

## Constructors

* `Clock()` - Default constructor for creating a timer

## Methods

|Type|Method|Purpose|Label|
|---|-----|----------|-----|
|Uint64|getTime|Returns the current time in milliseconds|<span class="green-stable">stable</span>|
|void|startTimer|Starts the timer. If the timer is already running, does nothing|<span class="green-stable">stable</span>|
|void|stopTimer|Stops the timer, the accumulated time is kept. If the timer is not running, does nothing|<span class="green-stable">stable</span>|
|Uint64|getTimer|Returns the timer's time in milliseconds: the current one for a running timer, the accumulated one for a stopped timer|<span class="green-stable">stable</span>|
|Uint64|lapTimer|Returns the elapsed timer time and resets it, after which the timer keeps counting from zero|<span class="green-stable">stable</span>|
