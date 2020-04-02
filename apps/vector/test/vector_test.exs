defmodule VectorTest do
  use ExUnit.Case
  doctest Vector

  test "add/2 raises a FunctionClauseError when the passed vectors are not compatible" do
    Vector.add([1], [2, 3])
  rescue
    e in FunctionClauseError -> assert e.function == :add
  end

  test "subtract/2 raises a FunctionClauseError when the passed vectors are not compatible" do
    Vector.subtract([1], [2, 3])
  rescue
    e in FunctionClauseError -> assert e.function == :subtract
  end
end
