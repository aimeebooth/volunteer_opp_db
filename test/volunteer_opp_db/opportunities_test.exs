defmodule VolunteerOppDb.OpportunitiesTest do
  use VolunteerOppDb.DataCase

  alias VolunteerOppDb.Opportunities

  describe "opportunities" do
    alias VolunteerOppDb.Opportunities.Opportunity

    import VolunteerOppDb.OpportunitiesFixtures

    @invalid_attrs %{description: nil, info_url: nil, name: nil}

    test "list_opportunities/0 returns all opportunities" do
      opportunity = opportunity_fixture()
      assert Opportunities.list_opportunities() == [opportunity]
    end

    test "get_opportunity!/1 returns the opportunity with given id" do
      opportunity = opportunity_fixture()
      assert Opportunities.get_opportunity!(opportunity.id) == opportunity
    end

    test "create_opportunity/1 with valid data creates a opportunity" do
      valid_attrs = %{description: "some description", info_url: "some info_url", name: "some name"}

      assert {:ok, %Opportunity{} = opportunity} = Opportunities.create_opportunity(valid_attrs)
      assert opportunity.description == "some description"
      assert opportunity.info_url == "some info_url"
      assert opportunity.name == "some name"
    end

    test "create_opportunity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Opportunities.create_opportunity(@invalid_attrs)
    end

    test "update_opportunity/2 with valid data updates the opportunity" do
      opportunity = opportunity_fixture()
      update_attrs = %{description: "some updated description", info_url: "some updated info_url", name: "some updated name"}

      assert {:ok, %Opportunity{} = opportunity} = Opportunities.update_opportunity(opportunity, update_attrs)
      assert opportunity.description == "some updated description"
      assert opportunity.info_url == "some updated info_url"
      assert opportunity.name == "some updated name"
    end

    test "update_opportunity/2 with invalid data returns error changeset" do
      opportunity = opportunity_fixture()
      assert {:error, %Ecto.Changeset{}} = Opportunities.update_opportunity(opportunity, @invalid_attrs)
      assert opportunity == Opportunities.get_opportunity!(opportunity.id)
    end

    test "delete_opportunity/1 deletes the opportunity" do
      opportunity = opportunity_fixture()
      assert {:ok, %Opportunity{}} = Opportunities.delete_opportunity(opportunity)
      assert_raise Ecto.NoResultsError, fn -> Opportunities.get_opportunity!(opportunity.id) end
    end

    test "change_opportunity/1 returns a opportunity changeset" do
      opportunity = opportunity_fixture()
      assert %Ecto.Changeset{} = Opportunities.change_opportunity(opportunity)
    end
  end
end
