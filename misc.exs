defmodule Misc do
  # sum up numbers from 1 to n
  def sum(1), do: 1
  def sum(n), do: n + sum(n - 1)

  # greatest common divisor
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))

  def func do
    import List, only: [flatten: 1]

    flatten [5, [6, 7], 8]
  end
end

IO.puts Misc.sum(10)
IO.puts Misc.gcd(16, 4)
IO.puts Misc.gcd(15, 4)
IO.puts Misc.gcd(15, 3)
IO.inspect Misc.func
