defmodule Example do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect([p1, p2, p3, p4])
  end

  # This function conflicts with the one above!
  # def func(p1, p2) do
  #   IO.inspect([p1, p2])
  # end

  def func2(p1, p2 \\ 123)

  def func2(p1, p2) when is_list(p1) do
    IO.puts "You said #{p2} with a list"
  end

  def func2(p1, p2) do
    IO.puts "You passed in #{p1} and #{p2}"
  end
end

Example.func(1, 2) # [1, 2, 3, 2]
Example.func(1, 2, 3) # [1, 2, 3, 3]
Example.func(1, 2, 3, 4) # [1, 2, 3, 4]
# Example.func(1, 2, 3, 4, 5) # error

Example.func2(99)
Example.func2(99, "cat")
Example.func2([99])
Example.func2([99], "dog")
