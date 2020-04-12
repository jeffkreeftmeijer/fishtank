defmodule Fishtank.Entity.BoundariesTest do
  use ExUnit.Case
  use ExUnitProperties
  doctest Fishtank.Entity.Boundaries
  alias Fishtank.{Entity, Entity.Boundaries}
  import Entity.Generator

  property "apply/1 keeps entities within the viewport's boundaries" do
    check all(entity <- entity()) do
      %Entity{location: [x, y]} = Boundaries.apply(entity)
      assert x <= 480
      assert x >= -480
      assert y <= 270
      assert y >= -270
    end
  end
end
