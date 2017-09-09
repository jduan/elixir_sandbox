list_concat = fn lst1, lst2 -> lst1 ++ lst2 end
IO.inspect list_concat.([:a, :b], [:c, :d])

sum = fn a, b, c -> a + b + c end
IO.puts sum.(1, 2, 3)

pair_tuple_to_list = fn {a, b} -> [a, b] end
IO.puts pair_tuple_to_list.({1234, 5678})

handle_open = fn
  {:ok, file} -> "First line: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("./sandbox.ex"))
IO.puts handle_open.(File.open("./non-existent.ex"))

fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n -> n
end

IO.puts fizzbuzz.(0, 0, 3)
IO.puts fizzbuzz.(0, 1, 3)
IO.puts fizzbuzz.(1, 0, 3)

fb = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.inspect Enum.map(10..16, fb)
