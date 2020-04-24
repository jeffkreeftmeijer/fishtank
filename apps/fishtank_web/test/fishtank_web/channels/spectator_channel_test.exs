defmodule FishtankWeb.SpectatorChannelTest do
  use FishtankWeb.ChannelCase

  setup do
    {:ok, _, socket} =
      FishtankWeb.UserSocket
      |> socket()
      |> subscribe_and_join(FishtankWeb.SpectatorChannel, "fishtank")

    %{socket: socket}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from!(socket, "broadcast", %{"some" => "data"})
    assert_push "broadcast", %{"some" => "data"}
  end

  test "joins the channel", %{socket: socket} do
    assert %Phoenix.Socket{
             joined: true,
             channel: FishtankWeb.SpectatorChannel,
             handler: FishtankWeb.UserSocket
           } = socket
  end

  test "registers the connection presence" do
    assert %{"fishtank" => %{metas: [%{phx_ref: _}]}} = FishtankWeb.Presence.list("fishtank")
  end
end
