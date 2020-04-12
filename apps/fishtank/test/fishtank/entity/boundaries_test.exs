defmodule Fishtank.Entity.BoundariesTest do
  use ExUnit.Case
  use ExUnitProperties
  doctest Fishtank.Entity.Boundaries
  alias Fishtank.{Entity, Entity.Boundaries}

  property "apply/1 keeps entities within the viewport's boundaries" do
    check all(entity <- entity()) do
      %Entity{location: [x, y]} = Boundaries.apply(entity)
      assert x <= 480
      assert x >= -480
      assert y <= 270
      assert y >= -270
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
