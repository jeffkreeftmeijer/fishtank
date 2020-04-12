defmodule Fishtank.Entity.Boundaries do
  alias Fishtank.Entity
  @width 960
  @height 540

  @doc ~S"""
  Enforces viewport boundaries by moving entities to the other side of the tank
  when reaching the edge.

  ## Examples

  iex> Fishtank.Entity.Boundaries.apply(%Fishtank.Entity{location: [123.0, 178.0]})
  %Fishtank.Entity{location: [123.0, 178.0]}
  iex> Fishtank.Entity.Boundaries.apply(%Fishtank.Entity{location: [490.0, -275.0]})
  %Fishtank.Entity{location: [-480.0, 270.0]}
  iex> Fishtank.Entity.Boundaries.apply(%Fishtank.Entity{location: [-510.0, 312.0]})
  %Fishtank.Entity{location: [480.0, -270.0]}

  """

  def apply(%Entity{location: [x, y]} = entity) when x > @width / 2 do
    apply(%{entity | location: [@width / -2, y]})
  end

  def apply(%Entity{location: [x, y]} = entity) when x < @width / -2 do
    apply(%{entity | location: [@width / 2, y]})
  end

  def apply(%Entity{location: [x, y]} = entity) when y > @height / 2 do
    apply(%{entity | location: [x, @height / -2]})
  end

  def apply(%Entity{location: [x, y]} = entity) when y < @height / -2 do
    apply(%{entity | location: [x, @height / 2]})
  end

  def apply(entity), do: entity
end
