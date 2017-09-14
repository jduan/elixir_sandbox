defmodule FizzBuzz do
  # return a list
  def upto(n) when n > 0 do
    1..n
    |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(num) do
    div3 = rem num, 3
    div5 = rem num, 5
    case {div3, div5} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      _      -> num
    end
  end
end
