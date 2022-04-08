defmodule VolunteerOppDb.ThirdParty.GlobalGiving do
  @api_key "c5353e7a-c42d-482c-a556-ce311ae3f6ce"

  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://www.globalgiving.org/api/"
  plug Afterbuy.Tesla.Middleware.Xml

  def list_project_ids do
    {:ok, %Tesla.Env{body: body}} = get("public/projectservice/all/projects/ids?#{auth_params()}")

    {:ok, body}
  end

  def auth_params(params \\ %{}) do
    Map.merge(params, %{api_key: @api_key})
    |> URI.encode_query()
  end
end
