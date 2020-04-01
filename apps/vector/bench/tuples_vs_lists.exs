defmodule VectorWithList do
  def add([x_one, y_one], [x_two, y_two]) do
    [x_one + x_two, y_one + y_two]
  end
end

Benchee.run(%{
  "tuple" => fn -> Vector.add({1.0, 2.0}, {3.0, 4.0}) end,
  "list" => fn -> VectorWithList.add([1.0, 2.0], [3.0, 4.0]) end
})
