defmodule MyEnum do
  def all?(enumerable, fun \\ fn x -> x end) do
    do_all?(enumerable, true, fun)
  end

  defp do_all?([], result, _fun), do: result
  defp do_all?(_enumerable, false, _fun), do: false
  defp do_all?([head | tail], true, fun), do: do_all?(tail, !!fun.(head), fun)

  def each([], _fun) do
  end
  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  def filter([], _fun), do: []
  def filter([head | tail], fun) do
    if fun.(head) do
      [head | filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end

  def split(enumerable, count) do
    do_split(enumerable, count, [])
  end

  defp do_split(enumerable, 0, left) do
    { Enum.reverse(left), enumerable }
  end
  defp do_split([], _count, left) do
    { Enum.reverse(left), [] }
  end
  defp do_split([head | tail], count, left) when count > 0 do
    do_split(tail, count - 1, [head | left])
  end

  def take(enumerable, count) do
    do_take(enumerable, count, [])
  end

  defp do_take([], _count, acc) do
    Enum.reverse acc
  end
  defp do_take(_enumerable, 0, acc) do
    Enum.reverse acc
  end
  defp do_take([head | tail], count, acc) when count > 0 do
    do_take(tail, count - 1, [head | acc])
  end

  def flatten([]), do: []
  def flatten([head | tail]) do
    if is_list(head) do
      flatten(head) ++ flatten(tail)
    else
      [head] ++ flatten(tail)
    end
  end
end
