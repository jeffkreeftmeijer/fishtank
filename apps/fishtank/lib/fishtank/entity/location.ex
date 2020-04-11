defmodule Fishtank.Entity.Location do
  alias Fishtank.Entity

  @doc ~S"""
  Updates the Entity's location.

  ## Examples

      iex> Fishtank.Entity.Location.update(
      ...>   %Fishtank.Entity{location: [1.0, 2.0], velocity: [3.0, 4.0]}
      ...> )
      %Fishtank.Entity{location: [4.0, 6.0], velocity: [3.0, 4.0]}

  """
  def update(%Entity{location: location, velocity: velocity} = entity) do
    %{entity | location: Vector.add(location, velocity)}
  end
end
