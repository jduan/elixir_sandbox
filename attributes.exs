defmodule Example do
  @author "Jingjing Duan"

  def get_author do
    @author
  end
end

IO.puts "Example was written by #{Example.get_author}"
