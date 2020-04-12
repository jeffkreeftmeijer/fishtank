defmodule Fishtank.Entity.Velocity do
  alias Fishtank.Entity

  @doc ~S"""
  Updates the Entity's location.

  ## Examples

      iex> Fishtank.Entity.Velocity.update(
      ...>   %Fishtank.Entity{velocity: [3.0, 4.0], acceleration: 2.0}
      ...> )
      %Fishtank.Entity{velocity: [5.0, 4.0], acceleration: 2.0}

  """
  @spec update(Entity.t()) :: Entity.t()
  def update(%Entity{velocity: velocity, acceleration: acceleration} = entity) do
    %{entity | velocity: Vector.add(velocity, [acceleration, 0.0])}
  end
end
