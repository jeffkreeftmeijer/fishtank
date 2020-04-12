defmodule Fishtank.Entity.LocationTest do
  use ExUnit.Case
  use ExUnitProperties
  doctest Fishtank.Entity.Location
  alias Fishtank.{Entity, Entity.Location}

  property "update/1 adds the Entity's velocity to its location" do
    check all(%Entity{location: [lx, ly], velocity: [vx, vy]} = entity <- entity()) do
      %Entity{location: location} = Location.update(entity)
      assert location == [lx + vx, ly + vy]
    end
  end

  defp entity() do
    gen all(location <- vector(), velocity <- vector()) do
      %Entity{location: location, velocity: velocity}
    end
  end

  defp vector() do
    gen all(x <- float(), y <- float()) do
      [x, y]
    end
  end
end
