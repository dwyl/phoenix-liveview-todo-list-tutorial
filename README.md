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

`Phoenix` is already an awesome web framework
that helps teams build reliable Apps & APIs fast. <br />
`LiveView` takes the simplicity of building realtime features
to the next level of elegance and simplicity.

`LiveView` lets us create a slick single a page app
with a **native** (_no lag or refresh_) experience
without writing `JavaScript`.

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
if you run your Phoenix App with
`mix phx.server`
and visit:
[http://localhost:4000](http://localhost:4000)
you should see the following:

![todo-list-ui](https://user-images.githubusercontent.com/194400/95678014-7f768700-0bc1-11eb-8728-5eae33cbb560.png)

Now that we have the layout looking like we want it,
we can move onto the fun part of making it _work_.
But _first_ let's fix the failing test.

If you run the test suite with the command:

```sh
mix test
```

You will see a failing test:

```sh
  1) test disconnected and connected render (LiveViewTodoWeb.PageLiveTest)
     test/live_view_todo_web/live/page_live_test.exs:6
     Assertion with =~ failed
     code:  assert disconnected_html =~ "Welcome to Phoenix!"
     left:  "<html lang=\"en\"><head><meta charset=\"utf-8\"/><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/><meta charset=\"UTF-8\" content=\"B28oGEQ9ci0VBhBWVV4aJFw2Oys_BmMEJ0PV2gKAxJjo7nbpeCytKWU4\" csrf-param=\"_csrf_token\" method-param=\"_method\" name=\"csrf-token\"/><title data-suffix=\" · Phoenix Framework\">LiveViewTodo · Phoenix Framework</title></p><section class=\"todoapp\"><header class=\"header\">
     <h1>todos</h1><input class=\"new-todo\" placeholder=\"What needs to be done?\" autofocus=\"\"/></header><section class=\"main\" style=\"display: block;\"><input id=\"toggle-all\" class=\"toggle-all\" type=\"checkbox\"/><label for=\"toggle-all\">Mark all as complete</label><ul class=\"todo-list\"><li data-id=\"1590167947253\" class=\"\"><div class=\"view\"><input class=\"toggle\" type=\"checkbox\"/><label>Learn how to build a Realtime Todo list in Phoenix LiveView</label><button class=\"destroy\">
     </button></div></li><li data-id=\"1590167956628\" class=\"completed\"><div class=\"view\"><input class=\"toggle\" type=\"checkbox\"/><label>Completed item</label><button class=\"destroy\"></button></div></li></ul></section><footer class=\"footer\" style=\"display: block;\"><span class=\"todo-count\"><strong>1</strong> item left</span><ul class=\"filters\"><li><a href=\"#/\" class=\"selected\">All</a></li><li><a href=\"#/active\">Active</a></li><li><a href=\"#/completed\">Completed</a></li></ul><button class=\"clear-completed\" style=\"display: block;\">Clear completed</button></footer></section></main></div></body></html>"
     right: "Welcome to Phoenix!"
     stacktrace:
       test/live_view_todo_web/live/page_live_test.exs:8: (test)


Finished in 0.2 seconds
3 tests, 1 failure

```

Open the `test/live_view_todo_web/live/page_live_test.exs` file
and update the test assertions from:

```elixir
assert disconnected_html =~ "Welcome to Phoenix!"
assert render(page_live) =~ "Welcome to Phoenix!"
```

To:

```elixir
assert disconnected_html =~ "Todos"
assert render(page_live) =~ "Todos"
```

Now when you re-run the tests:

```sh
mix test
```

You should see:

```sh
Compiling 1 file (.ex)
...

Finished in 0.2 seconds
3 tests, 0 failures
```

Everything passing again, lets get back to building!

<br />

### 3. Create the Todo List `items` Schema

In order to _store_ the todo list `items` we need a schema.
In your terminal run the following generator command:

```sh
mix phx.gen.schema Item items text:string person_id:integer status:integer
```

That will create two new files:

- `lib/live_view_todo/item.ex` - the schema
- `priv/repo/migrations/20201227070700_create_items.exs` - migration file (creates database table)

Reference:
https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Schema.html

Execute the migration file by running the following command:

```sh
mix ecto.migrate
```

You will see output similar to the following:

```sh
13:44:03.406 [info]  == Migrated 20170606070700 in 0.0s
```

Now that the schema has been created
we can write some code
to make the todo list functionality work.

#### 3.1 Add Aliases to `item.ex`

Before we create any new functions, let's open the
`lib/live_view_todo/item.ex`
file and make a couple of changes:

```elixir
defmodule LiveViewTodo.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :person_id, :integer
    field :status, :integer
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:text, :person_id, :status])
    |> validate_required([:text, :person_id, :status])
  end
end
```

First add the line `alias LiveViewTodo.Repo`
below the `import Ecto.Changeset` statement;
we need this alias so that we can make database queries.

Next add the line `alias __MODULE__` below the `alias` we just added;
this just means "alias the Struct contained in this file so we can reference it".
see: https://stackoverflow.com/questions/39854281/access-struct-inside-module/47501059

Finally remove the `:person_id, :status`
from the List of fields in `validate_required`.
We don't want `person_id` to be required for now
as we don't yet have authentication setup for the App.

Your file should now look like this:

```elixir
defmodule LiveViewTodo.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias LiveViewTodo.Repo
  alias __MODULE__

  schema "items" do
    field :person_id, :integer
    field :status, :integer
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:text, :person_id, :status])
    |> validate_required([:text])
  end
end
```

With those changes made, we can proceed to creating our functions.

#### 3.2 Create Todo Item CRUD Tests

The `phx.gen.schema` does not automatically create any
["CRUD"](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)
functions
to `Create` an `item` or `Read` `items` in/from the database
or tests for those functions,
so we need to create them ourselves now.

Create a new directory with the path:
`test/live_view_todo`
and in that new directory,
create a file:
`test/live_view_todo/item_test.exs`

Next _open_ the newly created file
`test/live_view_todo/item_test.exs`
and add the following test code to it:

```elixir
defmodule LiveViewTodo.ItemTest do
  use LiveViewTodo.DataCase
  alias LiveViewTodo.Item

  describe "items" do
    @valid_attrs %{text: "some text", person_id: 1}
    @update_attrs %{text: "some updated text", status: 1}
    @invalid_attrs %{text: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Item.create_item()

      item
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture(@valid_attrs)
      assert Item.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Item.create_item(@valid_attrs)
      assert item.text == "some text"

      inserted_item = List.first(Item.list_items())
      assert inserted_item.text == @valid_attrs.text
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Item.create_item(@invalid_attrs)
    end

    test "list_items/0 returns a list of todo items stored in the DB" do
      item1 = item_fixture()
      item2 = item_fixture()
      items = Item.list_items()
      assert Enum.member?(items, item1)
      assert Enum.member?(items, item2)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Item.update_item(item, @update_attrs)
      assert item.text == "some updated text"
    end
  end
end
```

Take a moment to _understand_ what is being tested.
Once you have written out (_or let's face it, copy-pasted_) the test code,
save the file and run the tests:

```
mix test test/live_view_todo/item_test.exs
```

Since the functions don't yet exist,
you will see all the test _fail_:

```
  1) test items get_item!/1 returns the item with given id (LiveViewTodo.ItemTest)
     test/live_view_todo/item_test.exs:19
     ** (UndefinedFunctionError) function LiveViewTodo.Item.create_item/1 is undefined or private
     code: item = item_fixture(@valid_attrs)
     stacktrace:
       (live_view_todo 0.1.0) LiveViewTodo.Item.create_item(%{person_id: 1, text: "some text"})
       test/live_view_todo/item_test.exs:14: LiveViewTodo.ItemTest.item_fixture/1
       test/live_view_todo/item_test.exs:20: (test)

etc ...

Finished in 0.2 seconds
5 tests, 5 failures
```

Hopefully these CRUD tests are familiar to you.
If they aren't, please read:
https://hexdocs.pm/phoenix/testing.html <br />
If you still have any doubts, please
[ask a specific question](https://github.com/dwyl/phoenix-liveview-todo-list-tutorial/issues/new).

The focus of this tutorial is `LiveView` not CRUD testing,
the sooner we get to the `LievView` part the better,
this is just the "setup" we need to do for inserting todo item data.

Let's write the functions to make the tests pass!

#### 3.3 Make the CRUD Tests _Pass_

Open the `lib/live_view_todo/item.ex` file
and add the following lines of code:

```elixir
@doc """
Creates a item.

## Examples

    iex> create_item(%{text: "Learn LiveView"})
    {:ok, %Item{}}

    iex> create_item(%{text: nil})
    {:error, %Ecto.Changeset{}}

"""
def create_item(attrs \\ %{}) do
  %Item{}
  |> changeset(attrs)
  |> Repo.insert()
end

@doc """
Gets a single item.

Raises `Ecto.NoResultsError` if the Item does not exist.

## Examples

    iex> get_item!(123)
    %Item{}

    iex> get_item!(456)
    ** (Ecto.NoResultsError)

"""
def get_item!(id), do: Repo.get!(Item, id)


@doc """
Returns the list of items.

## Examples

    iex> list_items()
    [%Item{}, ...]

"""
def list_items do
  Repo.all(Item)
end

@doc """
Updates a item.

## Examples

    iex> update_item(item, %{field: new_value})
    {:ok, %Item{}}

    iex> update_item(item, %{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def update_item(%Item{} = item, attrs) do
  item
  |> Item.changeset(attrs)
  |> Repo.update()
end
```

After saving the `item.ex` file,
re-run the tests with:

```sh
mix test test/live_view_todo/item_test.exs
```

You should see them pass:

```sh
.....

Finished in 0.2 seconds
5 tests, 0 failures

Randomized with seed 208543
```

Now that we have our CRUD functions written (_and documented+tested_),
we can move on to the _fun_ part, building the Todo App in `LiveView`!

<br />

### 4. Handle Todo List `Item` Creation

The first event we want to handle in our `LiveView` App is "create";
the act of creating a new Todo List `item`.

Open the `lib/live_view_todo_web/live/page_live.ex` file
and add the following

Open the `lib/live_view_todo_web/live/page_live.html.leex` file
and locate the line in the `<header>` section:

```html
<input class="new-todo" placeholder="What needs to be done?" autofocus="" />
```

Replace it with the following:

```html
<form phx-submit="create" id="form">
  <input
    id="new_todo"
    class="new-todo"
    type="text"
    name="text"
    placeholder="What needs to be done?"
    autofocus=""
    required="required"
  />
</form>
```

The important part is the `phx-submit="create"`
which tells `LiveView` which event to emit when the form is submitted.

Once you've saved the `page_live.html.leex` file,
open the `lib/live_view_todo_web/live/page_live.ex` file
and add the following code to it:

```elixir
@topic "live"

@impl true
def handle_event("create", %{"text" => text}, socket) do
  Item.create_item(%{text: text})
  socket = assign(socket, items: Item.list_items(), active: %Item{})
  LiveViewTodoWeb.Endpoint.broadcast_from(self(), @topic, "update", socket.assigns)
  {:noreply, socket}
end
```

The `@topic "live"` is the WebSocket (_Phoenix Channel_) topic
defined as a
[module attribute](https://elixir-lang.org/getting-started/module-attributes.html)
(_like a Global Constant_),
which we will use to both subscribe to and broadcast on.

```space




```

<!--
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
