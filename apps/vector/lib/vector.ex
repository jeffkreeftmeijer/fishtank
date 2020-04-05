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
    zip(one, two, [], &Kernel.+/2)
  end

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
    zip(one, two, [], &Kernel.-/2)
  end

  @doc ~S"""
  Multiplies a vector.

  ## Examples

      iex> Vector.multiply([1.0], 1.0)
      [1.0]
      iex> Vector.multiply([1.0, -2.0], -2.0)
      [-2.0, 4.0]
      iex> Vector.multiply([1.0, -2.0, 3.0], 3.0)
      [3.0, -6.0, 9.0]

  """
  @spec multiply(t, float) :: t
  def multiply(vector, multiplier) do
    Enum.map(vector, &(&1 * multiplier))
  end

  @doc ~S"""
  Divides a vector.

  ## Examples

      iex> Vector.divide([1.0], 1.0)
      [1.0]
      iex> Vector.divide([1.0, -2.0], -2.0)
      [-0.5, 1.0]
      iex> Vector.divide([1.0, -2.0, 3.0], 4.0)
      [0.25, -0.5, 0.75]

  """
  @spec divide(t, float) :: t
  def divide(vector, divider) do
    Enum.map(vector, &(&1 / divider))
  end

  defp zip([one | one_tail], [two | two_tail], acc, fun) do
    zip(one_tail, two_tail, [fun.(one, two) | acc], fun)
  end

  defp zip([], [], acc, _fun), do: Enum.reverse(acc)
end
