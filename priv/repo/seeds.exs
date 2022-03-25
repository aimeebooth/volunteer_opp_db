# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     VolunteerOppDb.Repo.insert!(%VolunteerOppDb.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

{:ok, _} =
  VolunteerOppDb.Opportunities.create_opportunity(%{
    name: "UNICEF",
    description:
      "UNICEF, also known as the United Nations Children's Fund, is a United Nations agency responsible for providing humanitarian and developmental aid to children worldwide. The agency is among the most widespread and recognizable social welfare organizations in the world, with a presence in 192 countries and territories.",
    info_url: "https://www.unicefusa.org/"
  })
