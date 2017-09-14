defmodule StringsBinaries do
  # return true if a single-quoted string contains only printable ASCII
  # characters (space through tilde)
  def only_printables?([]), do: true
  def only_printables?([head | tail]) when head >= ?\s and head <= ?~ do
    only_printables? tail
  end
  def only_printables?(_lst), do: false

  # return true if two params are anagrams
  def anagram?(word1, word2), do: word1 == Enum.reverse(word2)

  # Write a function that takes a single-quoted string of the form number [+-*/]
  # number and returns the result of the calculation. The indi- vidual numbers
  # do not have leading plus or minus signs.
  def calculate(lst) do
    {num1, rest} = Enum.split_while lst, &(&1 >= ?0 and &1 <= ?9)
    rest = Enum.drop_while rest, &(&1 == ?\s)
    [op | tail] = rest
    tail = Enum.drop_while tail, &(&1 == ?\s)
    num1 = Parse.number(num1)
    num2 = Parse.number(tail)

    case op do
      ?+ -> num1 + num2
      ?- -> num1 - num2
      ?* -> num1 * num2
      ?/ -> num1 / num2
    end
  end
end
