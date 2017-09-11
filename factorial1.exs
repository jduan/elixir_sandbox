defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0, do: n * of(n - 1)

  def of2(n), do: of2_helper(n, 1)

  defp of2_helper(0, acc), do: acc

  defp of2_helper(n, acc) do
    of2_helper(n - 1, acc * n)
  end
end

# Factorial.of(-3)
IO.puts "Factorial of 10 is: #{Factorial.of(10)}"
IO.puts "Factorial of 5 is: #{Factorial.of(5)}"
IO.puts "Factorial of 5 is: #{Factorial.of2(5)}"
# large_n = 10000
# IO.puts "Factorial of #{large_n} is: #{Factorial.of(large_n)}"
# IO.puts "Factorial of #{large_n} is: #{Factorial.of2(large_n)}"
