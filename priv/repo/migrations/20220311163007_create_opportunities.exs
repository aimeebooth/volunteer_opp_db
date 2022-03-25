defmodule VolunteerOppDb.Repo.Migrations.CreateOpportunities do
  use Ecto.Migration

  def change do
    create table(:opportunities) do
      add :name, :string
      add :description, :text
      add :info_url, :string

      timestamps()
    end
  end
end
