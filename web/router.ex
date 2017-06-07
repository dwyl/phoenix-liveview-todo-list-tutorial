defmodule TodoApi.Router do
  use TodoApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodoApi do
    pipe_through :api
    
    resources "/todos", TodoController, except: [:new, :edit]
  end
end
