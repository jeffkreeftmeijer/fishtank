defmodule FishtankWeb.Broadcaster do
  use GenServer

  def start_link(name: name, endpoint: endpoint) do
    GenServer.start_link(__MODULE__, [endpoint: endpoint], name: name)
  end

  def init(state) do
    schedule()
    {:ok, state}
  end

  def handle_info(:broadcast, [endpoint: endpoint] = state) do
    endpoint.broadcast(
      "fishtank",
      "update",
      %{
        entities: [
          %{x: :rand.uniform(100) - 50, y: :rand.uniform(100) - 50}
        ]
      }
    )

    schedule()
    {:noreply, state}
  end

  defp schedule() do
    Process.send_after(self(), :broadcast, 16)
  end
end
