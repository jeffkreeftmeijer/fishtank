defmodule Fishtank.Entity do
  @derive {Jason.Encoder, only: [:location]}
  defstruct location: [0.0, 0.0], velocity: [0.0, 0.0], acceleration: 0.0

  @type t :: %Fishtank.Entity{location: Vector.t(), velocity: Vector.t()}

  use GenServer

  alias Fishtank.Entity.Location

  def start_link(opts) do
    GenServer.start_link(__MODULE__, %__MODULE__{}, Keyword.merge([name: __MODULE__], opts))
  end

  def init(state) do
    schedule()
    {:ok, state}
  end

  def state(pid \\ __MODULE__) do
    GenServer.call(pid, :state)
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  def handle_info(:tick, state) do
    schedule()

    new_state =
      state
      |> update_acceleration()
      |> update_velocity()
      |> Location.update()

    {:noreply, new_state}
  end

  def update_acceleration(entity) do
    %{entity | acceleration: 0.1}
  end

  def update_velocity(entity) do
    %{entity | velocity: [:rand.uniform(300) / 100 - 2, :rand.uniform(300) / 100 - 2]}
  end

  defp schedule() do
    Process.send_after(self(), :tick, 16)
  end
end
