defmodule Chop do
  def guess(actual, range) do
    guess(actual, range, next_guess(range))
  end

  defp guess(actual, _range, actual) do
    IO.puts actual
  end

  defp guess(actual, first.._last, my_guess) when actual < my_guess do
    guess(actual, first..my_guess, next_guess(first..my_guess))
  end

  defp guess(actual, _first..last, my_guess) when actual > my_guess do
    guess(actual, my_guess..last, next_guess(my_guess..last))
  end

  defp next_guess(first..last) do
    guess = div(first + last, 2)
    IO.puts "Is it #{guess}"
    guess
  end
end

Chop.guess(273, 1..1000)
