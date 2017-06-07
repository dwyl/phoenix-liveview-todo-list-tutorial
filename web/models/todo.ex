defmodule TodoApi.Todo do
  use TodoApi.Web, :model

  schema "todos" do
    field :description, :string
    field :complete, :boolean
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description])
    |> validate_required([:description])
  end
end
