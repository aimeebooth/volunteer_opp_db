defmodule VolunteerOppDb.OpportunitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VolunteerOppDb.Opportunities` context.
  """

  @doc """
  Generate a opportunity.
  """
  def opportunity_fixture(attrs \\ %{}) do
    {:ok, opportunity} =
      attrs
      |> Enum.into(%{
        description: "some description",
        info_url: "some info_url",
        name: "some name"
      })
      |> VolunteerOppDb.Opportunities.create_opportunity()

    opportunity
  end
end
