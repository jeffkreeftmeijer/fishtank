defmodule FishtankWeb.SpectatorChannel do
  use FishtankWeb, :channel

  def join("fishtank", _message, socket) do
    {:ok, socket}
  end
end
