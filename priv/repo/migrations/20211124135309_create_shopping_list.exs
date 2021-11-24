defmodule Training.Repo.Migrations.CreateShoppingList do
  use Ecto.Migration

  def change do
    create table(:shopping_list) do
      add :title, :string
      add :done, :boolean, default: false, null: false

      timestamps()
    end
  end
end
