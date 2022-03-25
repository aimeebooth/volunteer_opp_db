defmodule VolunteerOppDb.ThirdParty.Marvel do
  @public_key "520103b81ee9d8938ede7db31cbef500"
  @private_key "5513531dc0e59293814ef5cb269f1ec872e9ced8"

  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://gateway.marvel.com:80/v1/public"
  plug Tesla.Middleware.JSON

  def list_characters do
    {:ok, %Tesla.Env{body: %{"code" => 200, "data" => data}}} =
      get("/characters?#{auth_params()}")

    {:ok, data}
  end

  def auth_params(params \\ %{}) do
    ts = :erlang.system_time()
    apikey = @public_key

    hash =
      :crypto.hash(:md5, "#{ts}#{@private_key}#{apikey}")
      |> Base.encode16(case: :lower)

    Map.merge(params, %{ts: ts, apikey: apikey, hash: hash})
    |> URI.encode_query()
  end
end

# GlobalGiving API
# api_key c5353e7a-c42d-482c-a556-ce311ae3f6ce
# https://www.globalgiving.org/api/
