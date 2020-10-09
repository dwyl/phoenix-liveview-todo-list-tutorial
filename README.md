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

### 2. Create the TodoMVC UI/UX

As we saw in the previous step, our App looks like a fresh Phoenix App.
Let's make it look like a todo list.

#### 2.1 Update Root Layout

Open the `lib/live_view_todo_web/templates/layout/root.html.leex` file
and remove the `<header>` section
such that the contents file is the following:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%= csrf_meta_tag() %>
    <%= live_title_tag assigns[:page_title] || "LiveViewTodo", suffix: " · Phoenix Framework" %>
    <link phx-track-static rel="stylesheet" href="<%= Routes.static_path(@conn, "/css/app.css") %>"/>
    <script defer phx-track-static type="text/javascript" src="<%= Routes.static_path(@conn, "/js/app.js") %>"></script>
  </head>
  <body>
    <%= @inner_content %>
  </body>
</html>
```

#### 2.2 Update Root Layout

Open the `lib/live_view_todo_web/live/page_live.html.leex` file
and replace the contents with the following:

```html
<section class="todoapp">
  <header class="header">
    <h1>todos</h1>
    <input class="new-todo" placeholder="What needs to be done?" autofocus="" />
  </header>
  <section class="main" style="display: block;">
    <input id="toggle-all" class="toggle-all" type="checkbox" />
    <label for="toggle-all">Mark all as complete</label>
    <ul class="todo-list">
      <li data-id="1590167947253" class="">
        <div class="view">
          <input class="toggle" type="checkbox" />
          <label>Learn how to build a Todo list in Phoenix</label>
          <button class="destroy"></button>
        </div>
      </li>
      <li data-id="1590167956628" class="completed">
        <div class="view">
          <input class="toggle" type="checkbox" />
          <label>Completed item</label>
          <button class="destroy"></button>
        </div>
      </li>
    </ul>
  </section>
  <footer class="footer" style="display: block;">
    <span class="todo-count"><strong>1</strong> item left</span>
    <ul class="filters">
      <li>
        <a href="#/" class="selected">All</a>
      </li>
      <li>
        <a href="#/active">Active</a>
      </li>
      <li>
        <a href="#/completed">Completed</a>
      </li>
    </ul>
    <button class="clear-completed" style="display: block;">
      Clear completed
    </button>
  </footer>
</section>
```

> **Note**: we borrowed this code from:
> https://github.com/dwyl/phoenix-todo-list-tutorial#3-create-the-todomvc-uiux
> our `Phoenix` (_without `LiveView`_) Todo List Tutorial.

If you attempt to run the app now
`mix phx.server`
and visit
[http://localhost:4000](http://localhost:4000) <br />
You will see this (_without the TodoMVC `CSS`_):

![before-adding-css](https://user-images.githubusercontent.com/194400/95677403-420ffa80-0bbd-11eb-9901-0604e08c6974.png)

That's obviously not what we want,
so let's get the TodoMVC `CSS`
and save it in our project!

<br />

### 2.3 Save the TodoMVC CSS to `/assets/css`

Visit
http://todomvc.com/examples/vanillajs/node_modules/todomvc-app-css/index.css <br />
and save the file to `/assets/css/todomvc-app.css`

e.g:
[`/assets/css/todomvc-app.css`](https://github.com/dwyl/phoenix-todo-list-tutorial/blob/65bec23b92307527a414f77b667b29ea10619e5a/assets/css/todomvc-app.css)

<br />

### 2.4 Import the `todomvc-app.css` in `app.scss`

Open the `assets/css/app.scss` file and replace it with the following:

```css
/* This file is for your main application css. */
/* @import "./phoenix.css"; */
@import "./todomvc-app.css";
```

We also commented out the line
`@import "./phoenix.css";`
because we don't want the Phoenix (Milligram) styles
_conflicting_ with the TodoMVC ones.

At the end of this step,
if you run your Phoenix App
`mix phx.server`
and visit:
[http://localhost:4000](http://localhost:4000)
you should see the following:

![todo-list-ui](https://user-images.githubusercontent.com/194400/95678014-7f768700-0bc1-11eb-8728-5eae33cbb560.png)

Now that we have the layout looking like we want it,
we can move onto the fun part of making it _work_.

<br />

### 3. Create the Todo List `items` Schema

In order to _store_ the todo list `items` we need a schema.
In your terminal run the following generator command:

```
mix phx.gen.schema Item items text:string person_id:integer
```

Reference:
https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Schema.html

```space




```

Keeping this for later:

```html
<form phx-change="suggest" phx-submit="search">
  <input
    type="text"
    name="q"
    value="<%= @query %>"
    placeholder="Live dependency search"
    list="results"
    autocomplete="off"
  />
  <datalist id="results">
    <%= for {app, _vsn} <- @results do %>
    <option value="<%= app %>"><%= app %></option>
    <% end %>
  </datalist>
  <button type="submit" phx-disable-with="Searching...">Go to Hexdocs</button>
</form>
```

<!--
Bonus Level Adding Timers with Typescript
https://benbarber.co.uk/blog/using-typescript-in-a-phoenix-project
https://levelup.gitconnected.com/elixir-phoenix-typescript-and-react-2020-edition-32ceb753705
-->
