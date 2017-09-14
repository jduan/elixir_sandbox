defmodule Parse do
  def number([]), do: 0

  def number([?- | tail]), do: 0 - number(tail)

  def number([?+ | tail]), do: number(tail)

  def number(lst), do: do_number(lst, 0)

  defp do_number([], acc), do: acc

  defp do_number([head | tail], acc) when head in '0123456789' do
    IO.puts "head: #{head}, tail: #{inspect tail}, acc: #{acc}"
    do_number(tail, acc * 10 + head - ?0)
  end

  defp do_number([head | _], _acc) do
    raise "Invalid digit '#{[head]}'"
  end
end
