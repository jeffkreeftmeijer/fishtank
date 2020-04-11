defmodule Fishtank.Entity do
  defstruct location: [0.0, 0.0]
  use GenServer

  @width 960
  @height 540

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %__MODULE__{}, name: __MODULE__)
  end

  def init(state) do
    schedule()
    {:ok, state}
  end

  def state() do
    GenServer.call(__MODULE__, :state)
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  def handle_info(:tick, state) do
    schedule()

    {:noreply, update_location(state)}
  end

  def update_location(entity) do
    %{
      entity
      | location: [:rand.uniform(@width) - @width / 2, :rand.uniform(@height) - @height / 2]
    }
  end

  defp schedule() do
    Process.send_after(self(), :tick, 16)
  end
end
