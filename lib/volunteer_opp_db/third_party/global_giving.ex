defmodule VolunteerOppDb.ThirdParty.GlobalGiving do
  @api_key "c5353e7a-c42d-482c-a556-ce311ae3f6ce"

  use Tesla

  plug Afterbuy.Tesla.Middleware.Xml
  plug Tesla.Middleware.BaseUrl, "https://api.globalgiving.org/api/"
  plug Tesla.Middleware.Timeout, timeout: 150_000

  plug Tesla.Middleware.Headers, [
    {"Content-Type", "application/xml"},
    {"Accept", "application/xml"}
  ]

  plug Afterbuy.Tesla.Middleware.Xml, decode_content_types: ["application/xml"]

  def list_project_ids do
    case get("public/projectservice/all/projects/ids?#{auth_params()}") do
      {:ok, %Tesla.Env{body: %{"projects" => %{"project" => body}}}} ->
        {:ok, body}

      error ->
        error
    end
  end

  def list_projects do
    case get("public/projectservice/all/projects/active?#{auth_params()}") do
      {:ok, %Tesla.Env{body: %{"projects" => %{"project" => body}}}} ->
        {:ok, body}

      {:ok, result} ->
        {:ok, result}

      error ->
        error
    end
  end

  def list_projects_summary do
    case get("public/projectservice/all/projects/summary?#{auth_params()}") do
      {:ok, %Tesla.Env{body: %{"projects" => %{"project" => body}}}} ->
        {:ok, body}

      error ->
        error
    end
  end

  def auth_params(params \\ %{}) do
    Map.merge(params, %{api_key: @api_key})
    |> URI.encode_query()
  end
end

# /projects/ids
# {:ok,
#  [
#    %{"id" => "6265"},
#    %{"id" => "2650"},
#    %{"id" => "1408"},
#    %{"id" => "5994"},
#    %{"id" => "3984"},
#    %{"id" => "6038"},
#    %{"id" => "2500"},
#    %{"id" => "3827"},
#    %{"id" => "4952"},
#    %{"id" => "4926"},
#    %{"id" => "6185"},
#    %{"id" => "1997"},
#    %{"id" => "2919"},
#    %{"id" => "4428"},
#    %{"id" => "4437"},
#    %{"id" => "4729"},
#    %{"id" => "4789"},
#    %{"id" => "5156"},
#    %{"id" => "5497"},
#    %{"id" => "6054"},
#    %{"id" => "6362"},
#    %{"id" => "6800"},
#    %{"id" => "2030"},
#    %{"id" => "5134"},
#    %{"id" => "1410"},
#    %{"id" => "5532"},
#    %{"id" => "6319"},
#    %{"id" => "4030"},
#    %{"id" => "6080"},
#    %{"id" => "4469"},
#    %{"id" => "4508"},
#    %{"id" => "5954"},
#    %{"id" => "5971"},
#    %{"id" => "6096"},
#    %{"id" => "1127"},
#    %{"id" => "1544"},
#    %{"id" => "1559"},
#    %{"id" => "3424"},
#    %{"id" => "5270"},
#    %{"id" => "4275"},
#    %{"id" => "6123"},
#    %{"id" => "6532"},
#    %{"id" => "4316"},
#    %{"id" => "5103"},
#    %{"id" => "4997"},
#    %{"id" => "6315"},
#    %{"id" => "1394"},
#    %{...},
#    ...
#  ]}
