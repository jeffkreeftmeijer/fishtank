defmodule FishtankWeb.SpectatorChannel do
  use FishtankWeb, :channel
  alias FishtankWeb.Presence

  def join("fishtank", _message, socket) do
    Presence.track(socket, "fishtank", %{})
    {:ok, socket}
  end
end
