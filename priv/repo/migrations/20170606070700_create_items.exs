defmodule LiveViewTodo.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :text, :string
      add :person_id, :integer
      add :status, :integer, default: 0

      timestamps()
    end

  end
end
