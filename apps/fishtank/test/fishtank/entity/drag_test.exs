defmodule Fishtank.Entity.DragTest do
  use ExUnit.Case
  use ExUnitProperties
  doctest Fishtank.Entity.Drag
  alias Fishtank.{Entity, Entity.Drag}
  import Fishtank.Entity.Generator

  property "apply/1 decreases an Entity's velocity" do
    check all(%Entity{velocity: [x, y]} = entity <- entity(&non_zero_vector/0)) do
      %Entity{velocity: [new_x, new_y]} = Drag.apply(entity)

      if x > 0 do
        assert new_x < x
      else
        assert new_x > x
      end

      if y > 0 do
        assert new_y < y
      else
        assert new_y > y
      end
    end
  end

  defp non_zero_vector() do
    bind_filter(vector(), fn [x, y] = vector ->
      if x != 0.0 and y != 0.0, do: {:cont, constant(vector)}, else: :skip
    end)
  end
end
