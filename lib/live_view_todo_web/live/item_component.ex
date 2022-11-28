defmodule LiveViewTodoWeb.ItemComponent do
  use LiveViewTodoWeb, :live_component
  alias LiveViewTodo.Item

  @topic "live"

  attr(:items, :list, default: [])

  def render(assigns) do
    ~H"""
    <ul class="todo-list" id="todo-list-items">
      <%= for item <- @items do %>
        <%= if item.id == @editing do %>
          <form phx-submit="update-item" id="form-update" phx-target={@myself}>
            <input
              id="update_todo"
              class="new-todo"
              type="text"
              name="text"
              required="required"
              value={item.text}
              phx-hook="FocusInputItem"
            />
            <input type="hidden" name="id" value={item.id} />
          </form>
        <% else %>
          <li data-id={item.id} class={completed?(item)}>
            <div class="view">
              <%= if checked?(item) do %>
                <input
                  class="toggle"
                  type="checkbox"
                  phx-value-id={item.id}
                  phx-click="toggle"
                  checked
                  phx-target={@myself}
                />
              <% else %>
                <input
                  class="toggle"
                  type="checkbox"
                  phx-value-id={item.id}
                  phx-click="toggle"
                  phx-target={@myself}
                />
              <% end %>
              <label phx-click="edit-item" phx-value-id={item.id} phx-target={@myself}>
                <%= item.text %>
              </label>
              <button class="destroy" phx-click="delete" phx-value-id={item.id} phx-target={@myself}>
              </button>
            </div>
          </li>
        <% end %>
      <% end %>
    </ul>
    """
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
  def handle_event("edit-item", data, socket) do
    {:noreply, assign(socket, editing: String.to_integer(data["id"]))}
  end

  @impl true
  def handle_event("update-item", %{"id" => item_id, "text" => text}, socket) do
    current_item = Item.get_item!(item_id)
    Item.update_item(current_item, %{text: text})
    items = Item.list_items()
    socket = assign(socket, items: items, editing: nil)
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

  def checked?(item) do
    not is_nil(item.status) and item.status > 0
  end

  def completed?(item) do
    if not is_nil(item.status) and item.status > 0, do: "completed", else: ""
  end
end
