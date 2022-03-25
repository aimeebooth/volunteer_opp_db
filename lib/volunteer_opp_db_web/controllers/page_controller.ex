defmodule VolunteerOppDbWeb.PageController do
  use VolunteerOppDbWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
