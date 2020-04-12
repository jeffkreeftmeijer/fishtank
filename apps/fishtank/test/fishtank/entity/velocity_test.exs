defmodule Fishtank.Entity.VelocityTest do
  use ExUnit.Case
  use ExUnitProperties
  doctest Fishtank.Entity.Velocity
  alias Fishtank.{Entity, Entity.Velocity}
  import Fishtank.Entity.Generator

  property "update/1 adds the Entity's acceleration to its velocity" do
    check all(%Entity{velocity: [vx, vy], acceleration: acceleration} = entity <- entity()) do
      %Entity{velocity: velocity} = Velocity.update(entity)
      assert velocity == [vx + acceleration, vy]
    end
  end
end
