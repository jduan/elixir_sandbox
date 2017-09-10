defmodule Misc do
  # sum up numbers from 1 to n
  def sum(1), do: 1
  def sum(n), do: n + sum(n - 1)

  # greatest common divisor
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

IO.puts Misc.sum(10)
IO.puts Misc.gcd(16, 4)
IO.puts Misc.gcd(15, 4)
IO.puts Misc.gcd(15, 3)
