defmodule Canvas do
  @defaults [ fg: "black", bg: "white", font: "Merriweather" ]
  def draw_text(text, options \\ []) do
    options = Keyword.merge(@defaults, options)
    IO.puts "Drawing text #{inspect(text)}"
    IO.puts "Foreground: #{options[:fg]}" # "red"
    IO.puts "Background: #{Keyword.get(options, :bg)}" # "white"
    IO.puts "Font: #{Keyword.get(options, :font)}" # "Merriweather"
    IO.puts "Pattern: #{Keyword.get(options, :pattern, "solid")}" # "solid"
    IO.puts "Style: #{inspect Keyword.get_values(options, :style)}" # ["italic", "bold"]
  end
end

Canvas.draw_text("hello", fg: "red", style: "italic", style: "bold")
