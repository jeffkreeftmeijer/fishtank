defmodule VectorWithStatic do
  def add([x_one, y_one], [x_two, y_two]) do
    {x_one + x_two, y_one, y_two}
  end
end

defmodule VectorWithEnum do
  def add(one, two) do
    one
    |> Enum.with_index()
    |> Enum.map(fn {value, index} ->
      value + Enum.at(two, index)
    end)
  end
end

Benchee.run(%{
  "static" => fn -> VectorWithStatic.add([1, 2], [3, 4]) end,
  "enum" => fn -> VectorWithEnum.add([1, 2], [3, 4]) end,
  "recursive" => fn -> Vector.add([1, 2], [3, 4]) end
})
