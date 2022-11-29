defmodule LiveViewTodoWeb.PageLive do
  use LiveViewTodoWeb, :live_view
  alias LiveViewTodo.Item

  @topic "live"

  @impl true
  def mount(_params, _session, socket) do
    # subscribe to the channel
    if connected?(socket), do: LiveViewTodoWeb.Endpoint.subscribe(@topic)
    {:ok, assign(socket, items: Item.list_items(), editing: nil)}
  end

  @impl true
  def handle_event("create", %{"text" => text}, socket) do
    Item.create_item(%{text: text})
    socket = assign(socket, items: Item.list_items(), active: %Item{})
    LiveViewTodoWeb.Endpoint.broadcast_from(self(), @topic, "update", socket.assigns)
    {:noreply, socket}
  end

  @impl true
  def handle_event("clear-completed", _data, socket) do
    Item.clear_completed()
    items = Item.list_items()
    {:noreply, assign(socket, items: items)}
  end

  @impl true
  def handle_info(%{event: "update", payload: %{items: items}}, socket) do
    {:noreply, assign(socket, items: items)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    items = Item.list_items()

    case params["filter_by"] do
      "completed" ->
        completed = Enum.filter(items, &(&1.status == 1))
        {:noreply, assign(socket, items: completed)}

      "active" ->
        active = Enum.filter(items, &(&1.status == 0))
        {:noreply, assign(socket, items: active)}

      _ ->
        {:noreply, assign(socket, items: items)}
    end
  end
end
