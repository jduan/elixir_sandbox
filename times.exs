defmodule Times do
  def double(n) do
    n * 2
  end

  def triple(n), do: n * 3

  def quadruple(n) do
    double(double n)
  end
end

IO.puts Times.double(3)
IO.puts Times.triple(3)
IO.puts Times.quadruple(3)
IO.inspect(Enum.map 1..5, &Times.double/1)
