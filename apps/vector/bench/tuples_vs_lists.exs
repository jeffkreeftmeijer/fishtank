defmodule VectorWithTuple do
  def add({x_one, y_one}, {x_two, y_two}) do
    {x_one + x_two, y_one + y_two}
  end
end

Benchee.run(%{
  "tuple" => fn -> VectorWithTuple.add({1.0, 2.0}, {3.0, 4.0}) end,
  "list" => fn -> Vector.add([1.0, 2.0], [3.0, 4.0]) end
})
