defmodule VolunteerOppDbWeb.OpportunityLive.FormComponent do
  use VolunteerOppDbWeb, :live_component

  alias VolunteerOppDb.Opportunities

  @impl true
  def update(%{opportunity: opportunity} = assigns, socket) do
    changeset = Opportunities.change_opportunity(opportunity)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"opportunity" => opportunity_params}, socket) do
    changeset =
      socket.assigns.opportunity
      |> Opportunities.change_opportunity(opportunity_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"opportunity" => opportunity_params}, socket) do
    save_opportunity(socket, socket.assigns.action, opportunity_params)
  end

  defp save_opportunity(socket, :edit, opportunity_params) do
    case Opportunities.update_opportunity(socket.assigns.opportunity, opportunity_params) do
      {:ok, _opportunity} ->
        {:noreply,
         socket
         |> put_flash(:info, "Opportunity updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_opportunity(socket, :new, opportunity_params) do
    case Opportunities.create_opportunity(opportunity_params) do
      {:ok, _opportunity} ->
        {:noreply,
         socket
         |> put_flash(:info, "Opportunity created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
