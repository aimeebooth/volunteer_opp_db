defmodule VolunteerOppDb.Opportunities.Opportunity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opportunities" do
    field :description, :string
    field :info_url, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(opportunity, attrs) do
    opportunity
    |> cast(attrs, [:name, :description, :info_url])
    |> validate_required([:name, :description, :info_url])
  end
end
