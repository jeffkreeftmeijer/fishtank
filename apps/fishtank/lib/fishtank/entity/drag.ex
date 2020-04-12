defmodule Fishtank.Entity.Drag do
  alias Fishtank.Entity

  @doc ~S"""
  Applies drag to the entity's velocity.

  ## Examples

      iex> Fishtank.Entity.Drag.apply(%Fishtank.Entity{velocity: [3.0, 4.0]})
      %Fishtank.Entity{velocity: [1.5, 2.0]}
      iex> Fishtank.Entity.Drag.apply(%Fishtank.Entity{velocity: [0.0, 0.0]})
      %Fishtank.Entity{velocity: [0.0, 0.0]}

  """
  def apply(%Entity{velocity: velocity} = entity) do
    %{entity | velocity: Vector.add(velocity, drag(velocity))}
  end

  defp drag([0.0, 0.0]), do: [0.0, 0.0]

  defp drag(velocity) do
    speed = Vector.magnitude(velocity)

    Vector.set_magnitude(velocity, -0.1 * speed * speed)
  end
end
