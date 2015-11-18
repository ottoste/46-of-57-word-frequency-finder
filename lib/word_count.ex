defmodule WordCount do

	def make_list_of_string({:ok, text}) do
  	String.downcase(text)
		|> String.codepoints
		|> Enum.filter(fn c -> c =~ ~r/[a-z]/ or c =~ ~r/[ ]/ end)
		|> List.to_string
		|> String.split(" ")
  end

	def get_count_of_word_appearance(list_of_text) do
		Enum.reduce(list_of_text, %{}, fn(word_from_list, count) -> update_count(word_from_list, count) end)
	end

    def update_count(word_from_list, count) do
    Map.update(count, String.to_atom(word_from_list), 1, fn(count) -> (count + 1) end)
  end

  def create_map_from_text do
  	File.read("text.txt")
  	|>make_list_of_string
  	|>get_count_of_word_appearance
  end

  def sort_collection(collection) do
    Enum.sort_by(collection, fn{k, v} -> v end)
    |>Enum.reverse
  end

  def create_histogram(sorted_list) do
  	Enum.map(sorted_list, fn({x, y}) -> Atom.to_string(x) <> ": " <> String.duplicate("*", y) end)
  end

  def display do
  	create_map_from_text
  	|> sort_collection
    |> create_histogram
    |> Enum.each(fn(x) -> IO.puts(x) end)
  end
end