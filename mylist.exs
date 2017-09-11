defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def add1([]), do: []
  def add1([head | tail]), do: [head + 1 | add1(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]


  def sum(lst), do: sum(lst, 0)
  defp sum([], total), do: total
  defp sum([head | tail], total), do: sum(tail, head + total)

  def reduce([], acc, _func), do: acc
  def reduce([head | tail], acc, func) do
    reduce(tail, func.(head, acc), func)
  end

  def mapsum(lst, func) do
    lst
    |> map(func)
    |> sum
  end

  def max(lst, empty_fallback \\ fn -> raise "fallback needed" end) do
    case length(lst) do
      0 -> empty_fallback.()
      _ -> do_max(tl(lst), hd(lst))
    end
  end
  defp do_max([], current_max), do: current_max
  defp do_max([head | tail], current_max) do
    do_max(tail, Kernel.max(head, current_max))
  end

  def caesar(lst, n) do
    Enum.map(lst, fn char ->
      wrap(char, n)
    end)
  end

  # Given a character, add n to it and wrap around if the result is
  # greater than z
  defp wrap(char, n) do
    new_char = char + rem(n, 26)
    if new_char > ?z do
      ?a + new_char - ?z
    else
      new_char
    end
  end

  def span(from, from), do: [from]
  def span(from, to) when from < to do
    [from | span(from + 1, to)]
  end
end

lst = [1, 2, 3, 4]
IO.puts "Length of #{inspect lst} is #{MyList.len(lst)}"
IO.puts "Square of list #{inspect lst} is #{inspect MyList.square(lst)}"
IO.puts "Adding 1 to each element: #{inspect MyList.add1(lst)}"
IO.puts "Adding 2 to each element: #{inspect MyList.map(lst, &(&1 + 2))}"
IO.puts "Sum of all the elements: #{inspect MyList.sum(lst)}"
