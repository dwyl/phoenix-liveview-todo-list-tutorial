<div align="center">

# Phoenix LiveView Todo List Tutorial

[![Build Status](https://img.shields.io/travis/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](https://travis-ci.org/dwyl/phoenix-liveview-counter-tutorial)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](http://codecov.io/github/dwyl/phoenix-liveview-counter-tutorial?branch=master)
[![Hex pm](http://img.shields.io/hexpm/v/phoenix_live_view.svg?style=flat-square)](https://hex.pm/packages/phoenix_live_view)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)
[![HitCount](http://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial.svg)](http://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial)

**Build your _second_ App** using **Phoenix LiveView** <br />
and _understand_ how to build real-world apps in **20 minutes** or _less_!

<!-- TODO: add image once app finished
<div>
  <a href="https://live-view-counter.herokuapp.com/">
    <img src="https://user-images.githubusercontent.com/194400/76150696-2e3f6b80-60a5-11ea-8d65-1999a70bb40a.gif">
  </a>
</div>
-->

</div>
<br />

## Why? 🤷

Phoenix LiveView offers a **_significantly simpler_** way
of building responsive realtime web applications
that _look_ like single a page app
and _feel_ like a **native** (_no lag or refresh_) experience.

## What? 💭

This tutorial builds a Todo List from scratch
using Phoenix LiveView in _less_ than 20 minutes.

## Who? 👤

This tutorial is aimed at LiveView beginners
who want to _understand_ how everything works
using a familiar UI.

If you are completely new to Phoenix and LiveView,
we recommend you follow the **LiveView _Counter_ Tutorial**:
https://github.com/dwyl/phoenix-liveview-counter-tutorial

### Prerequisites: What you Need _Before_ You Start 📝

This tutorial expects you have a `Elixir`, `Phoenix` and `Node.js` installed.
If you don't already have them on your computer,
please see:
https://github.com/dwyl/learn-elixir#installation
and
https://hexdocs.pm/phoenix/installation.html#phoenix

## How? 💻

> 💡 You can also try the version deployed to Heroku:
> https://live-view-counter.herokuapp.com

<br />

### Step 0: Run the _Finished_ Todo App on your `localhost` 🏃‍

Before you attempt to _build_ the todo list app,
we suggest that you clone and _run_
the complete app on your `localhost`. <br />
That way you _know_ it's working
without much effort/time expended.

#### Clone the Repository

On your `localhost`,
run the following command to clone the repo
and change into the directory:

```sh
git clone https://github.com/dwyl/phoenix-liveview-todo-list-tutorial.git
cd phoenix-liveview-todo-list-tutorial
```

#### _Download_ the Dependencies

Install the dependencies by running the command:

```sh
mix setup
```

It will take a few seconds to download the dependencies
depending on the speed of your internet connection;
be
[patient](https://user-images.githubusercontent.com/194400/76169853-58139380-6174-11ea-8e03-4011815758d0.png).
😉

#### _Run_ the App

Start the Phoenix server by running the command:

```sh
mix phx.server
```

Now you can visit
[`localhost:4000`](http://localhost:4000)
in your web browser.

> 💡 Open a _second_ browser window (_e.g. incognito mode_),
> you will see the the counter updating in both places like magic!

You should expect to see:

<!--
# Todo: insert screenshot of realtime todo list here

![phoenix-liveview-todo]()
-->

With the _finished_ version of the App running on your machine
and a clear picture of where we are headed, it's time to _build_ it!

<br />

### Step 1: Create the App 🆕

In your terminal run the following `mix` command
to generate the new Phoenix app:

```sh
mix phx.new live_view_todo --live
```

The `--live` flag tells the `phx.new`
(new `Phoenix` App) generator command
that we are creating a `LiveView` application.
It will setup the dependencies and boilerplate
for us to get going as fast as possible.

When you see the following prompt in your terminal:

```sh
Fetch and install dependencies? [Yn]
```

Type <kbd>Y</kbd> followed by the <kbd>Enter</kbd> key.
That will download all the necessary dependencies.

#### Checkpoint 1: _Run_ the _Tests_!

In your terminal, go into the newly created app folder using:

```sh
cd live_view_todo
```

And then run the following `mix` command:

```sh
mix test
```

You should see:

```
Generated phoenix app
==> live_view_counter
Compiling 14 files (.ex)
Generated live_view_counter app
...

Finished in 0.02 seconds
3 tests, 0 failures
```

Tests all pass.
This is _expected_ with a new app.
It's a good way to confirm everything is working.

<br />

#### Checkpoint 1b: _Run_ the New Phoenix App!

Run the server by executing this command:

```sh
mix phx.server
```

Visit
[`localhost:4000`](http://localhost:4000)
in your web browser.

![welcome-to-phoenix-liveview](https://user-images.githubusercontent.com/194400/95674046-99a26c00-0ba5-11eb-94e8-eec6840035a0.png)

> 🏁 Snapshot of code at the end of Step 1:
> [`#25ba4e7`](https://github.com/dwyl/phoenix-liveview-todo-list-tutorial/commit/25ba4e75cee1dd038fff71aa1ba4b17330d692c9)

<br />

### Step 2. Create the Todo List `items` Schema

In order to _store_ the todo list `items` we need a schema.

Reference:
https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Schema.html
