defmodule Fishtank.Entity.Velocity do
  alias Fishtank.Entity

  @doc ~S"""
  Updates the Entity's location.

  ## Examples

      iex> Fishtank.Entity.Velocity.update(
      ...>   %Fishtank.Entity{velocity: [3.0, 4.0], acceleration: 2.0, rotation: :math.pi / 2}
      ...> )
      %Fishtank.Entity{velocity: [3.0, 6.0], acceleration: 2.0, rotation: :math.pi / 2}

  """
  @spec update(Entity.t()) :: Entity.t()
  def update(%Entity{velocity: velocity, acceleration: acceleration, rotation: rotation} = entity) do
    %{entity | velocity: Vector.add(velocity, Vector.from_angle(rotation, acceleration))}
  end
end
