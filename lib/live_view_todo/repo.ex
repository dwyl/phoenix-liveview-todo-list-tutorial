defmodule LiveViewTodo.Repo do
  use Ecto.Repo,
    otp_app: :live_view_todo,
    adapter: Ecto.Adapters.Postgres
end
