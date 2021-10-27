defmodule LiveViewTodoWeb.PageView do
  use LiveViewTodoWeb, :view

  def checked?(item) do
    if not is_nil(item.status) and item.status > 0, do: true, else: false
  end

  def completed?(item) do
    if not is_nil(item.status) and item.status > 0, do: "completed", else: ""
  end
end
