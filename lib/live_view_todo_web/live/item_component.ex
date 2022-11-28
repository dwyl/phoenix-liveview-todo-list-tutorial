defmodule LiveViewTodoWeb.ItemComponent do
  use LiveViewTodoWeb, :live_component

  # def update(assigns, socket) do
  #   {:ok, socket}
  # end
  attr :items, :list, default: []

  def checked?(item) do
    not is_nil(item.status) and item.status > 0
  end

  def completed?(item) do
    if not is_nil(item.status) and item.status > 0, do: "completed", else: ""
  end
end
