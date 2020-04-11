defmodule Fishtank.EntityTest do
  use ExUnit.Case
  alias Fishtank.Entity

  test "is started by the main supervisor" do
    assert Entity
           |> Process.whereis()
           |> is_pid()
  end

  test "updates its state every 16 ms" do
    assert 1..3
           |> Enum.map(fn _ ->
             :timer.sleep(20)
             Entity.state()
           end)
           |> Enum.uniq()
           |> length() > 1
  end

  describe "state/0" do
    test "returns the entity's state" do
      assert %Entity{} = Entity.state()
    end
  end

  describe "update_location/1" do
    test "updates the entity's location" do
      %Entity{location: updated_location} = Entity.update_location(%Entity{})
      refute updated_location == [0.0, 0.0]
    end
  end
end
