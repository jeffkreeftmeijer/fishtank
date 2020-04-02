defmodule Vector do
  @type t :: [float]

  @doc ~S"""
  Adds two vectors.

  ## Examples

      iex> Vector.add([1.0], [-0.6])
      [0.4]
      iex> Vector.add([1.0, -2.0], [-0.6, 0.5])
      [0.4, -1.5]
      iex> Vector.add([1.0, -2.0, 3.0], [-0.6, 0.5, -0.4])
      [0.4, -1.5, 2.6]

  """
  @spec add(t, t) :: t
  def add(one, two) when length(one) == length(two) do
    add(one, two, [])
  end

  def add([one | one_tail], [two | two_tail], acc) do
    add(one_tail, two_tail, [one + two | acc])
  end

  def add([], [], acc), do: Enum.reverse(acc)

  @doc ~S"""
  Subtracts two vectors.

  ## Examples

      iex> Vector.subtract([1.0], [-0.6])
      [1.6]
      iex> Vector.subtract([1.0, -2.0], [-0.6, 0.5])
      [1.6, -2.5]
      iex> Vector.subtract([1.0, -2.0, 3.0], [-0.6, 0.5, -0.4])
      [1.6, -2.5, 3.4]

  """
  @spec subtract(t, t) :: t
  def subtract(one, two) when length(one) == length(two) do
    subtract(one, two, [])
  end

  def subtract([one | one_tail], [two | two_tail], acc) do
    subtract(one_tail, two_tail, [one - two | acc])
  end

  def subtract([], [], acc), do: Enum.reverse(acc)
end
