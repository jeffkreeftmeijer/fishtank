defmodule Vector do
  @type t :: {float, float}

  @doc ~S"""
  Adds two vectors.

  ## Example

      iex> Vector.add({1.0, 2.0}, {3.0, 4.0})
      {4.0, 6.0}

  """
  @spec add(t, t) :: t
  def add({x_one, y_one}, {x_two, y_two}) do
    {x_one + x_two, y_one + y_two}
  end
end
