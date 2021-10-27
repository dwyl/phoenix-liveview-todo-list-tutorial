defmodule LiveViewTodoWeb.PageLive do
  use Phoenix.LiveView, layout: {LiveViewTodoWeb.LayoutView, "live.html"}
  alias LiveViewTodo.Item

  @topic "live"

  @impl true
  def mount(_params, _session, socket) do
    # subscribe to the channel
    LiveViewTodoWeb.Endpoint.subscribe(@topic)
    {:ok, assign(socket, items: Item.list_items())}
  end

  @impl true
  def render(assigns) do
    LiveViewTodoWeb.PageView.render("page_live.html", assigns)
  end

  @impl true
  def handle_event("create", %{"text" => text}, socket) do
    Item.create_item(%{text: text})
    socket = assign(socket, items: Item.list_items(), active: %Item{})
    LiveViewTodoWeb.Endpoint.broadcast_from(self(), @topic, "update", socket.assigns)
    {:noreply, socket}
  end

  @impl true
  def handle_event("toggle", data, socket) do
    status = if Map.has_key?(data, "value"), do: 1, else: 0
    item = Item.get_item!(Map.get(data, "id"))
    Item.update_item(item, %{id: item.id, status: status})
    socket = assign(socket, items: Item.list_items(), active: %Item{})
    LiveViewTodoWeb.Endpoint.broadcast_from(self(), @topic, "update", socket.assigns)
    {:noreply, socket}
  end

  @impl true
  def handle_event("delete", data, socket) do
    Item.delete_item(Map.get(data, "id"))
    socket = assign(socket, items: Item.list_items(), active: %Item{})
    LiveViewTodoWeb.Endpoint.broadcast_from(self(), @topic, "update", socket.assigns)
    {:noreply, socket}
  end

  @impl true
  def handle_info(data, socket) do
    {:noreply, assign(socket, items: data.payload.items)}
  end
end
