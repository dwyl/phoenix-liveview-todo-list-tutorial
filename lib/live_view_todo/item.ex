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
