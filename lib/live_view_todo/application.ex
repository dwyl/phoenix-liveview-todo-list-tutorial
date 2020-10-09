defmodule LiveViewTodo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LiveViewTodo.Repo,
      # Start the Telemetry supervisor
      LiveViewTodoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveViewTodo.PubSub},
      # Start the Endpoint (http/https)
      LiveViewTodoWeb.Endpoint
      # Start a worker by calling: LiveViewTodo.Worker.start_link(arg)
      # {LiveViewTodo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveViewTodo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LiveViewTodoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
