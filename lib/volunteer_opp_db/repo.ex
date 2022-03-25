defmodule VolunteerOppDb.Repo do
  use Ecto.Repo,
    otp_app: :volunteer_opp_db,
    adapter: Ecto.Adapters.Postgres
end
