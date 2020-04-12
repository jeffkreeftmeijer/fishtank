defmodule Fishtank.Entity.Generator do
  alias Fishtank.Entity
  import StreamData

  def entity(vector_generator \\ &vector/0) do
    bind({vector_generator.(), vector_generator.()}, fn {location, velocity} ->
      constant(%Entity{location: location, velocity: velocity})
    end)
  end

  def vector() do
    bind({float(), float()}, fn {x, y} ->
      constant([x, y])
    end)
  end
end
