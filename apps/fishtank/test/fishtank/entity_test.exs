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

  test "converts to JSON" do
    assert Jason.encode(%Entity{}) == {:ok, "{\"location\":[0.0,0.0],\"rotation\":0.0}"}
  end

  describe "state/0" do
    test "returns the entity's state" do
      assert %Entity{} = Entity.state()
    end
  end

  describe "state/1" do
    test "returns the entity's state" do
      assert %Entity{} = Entity.state(Entity)
    end
  end

  describe ":tick" do
    setup do
      {:ok, pid} = Entity.start_link(name: __MODULE__)
      send(pid, :tick)

      %{state: Entity.state(pid)}
    end

    test "updates the entity's rotation", %{state: %Entity{rotation: rotation}} do
      refute rotation == 0.0
    end

    test "updates the entity's acceleration", %{state: %Entity{acceleration: acceleration}} do
      refute acceleration == 0.0
    end

    test "updates the entity's velocity", %{state: %Entity{velocity: velocity}} do
      refute velocity == [0.0, 0.0]
    end

    test "updates the entity's location", %{state: %Entity{location: location}} do
      refute location == [0.0, 0.0]
    end
  end

  describe "update_rotation/1" do
    test "updates the entity's rotation" do
      %Entity{rotation: updated_rotation} = Entity.update_rotation(%Entity{})
      refute updated_rotation == 0.0
    end
  end
end
