defmodule VolunteerOppDbWeb.OpportunityLive.Show do
  use VolunteerOppDbWeb, :live_view

  alias VolunteerOppDb.Opportunities

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:opportunity, Opportunities.get_opportunity!(id))}
  end

  defp page_title(:show), do: "Show Opportunity"
  defp page_title(:edit), do: "Edit Opportunity"
end
