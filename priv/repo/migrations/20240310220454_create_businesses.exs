defmodule Demo.Repo.Migrations.CreateBusinesses do
  use Ecto.Migration

  def change do
    create table(:businesses) do
      add :name, :string
      add :description, :text
      add :tag, :string

      timestamps(type: :utc_datetime)
    end
  end
end
