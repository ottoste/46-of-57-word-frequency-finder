defmodule WordCountTest do
  use ExUnit.Case
  doctest WordCount

  test "make list of words" do
    assert WordCount.make_list_of_string({:ok, "Hello, world!"}) == ["hello", "world"]
  end
 
  test "make map of word and the count" do
  	assert WordCount.get_count_of_word_appearance(["hello"]) == %{hello: 1}
  end

  test "make map of word counts from the list of words" do
  	assert WordCount.get_count_of_word_appearance(["hello", "hello", "world"]) == %{hello: 2, world: 1}
  end

  test "sorts a map with one elements by the highest value" do
    collection = %{another_word: 2}
    assert WordCount.sort_collection(collection) == [another_word: 2] 
  end

  test "sorts a map with two elements by the highest value" do
    collection = %{another_word: 2, word: 3}
    assert WordCount.sort_collection(collection) == [word: 3, another_word: 2]
  end

  test "sorts a map with three elements by the highest value" do
    collection = %{some_word: 4, another_word: 2, word: 3}
    assert WordCount.sort_collection(collection) == [some_word: 4, word: 3, another_word: 2]
  end

  test "converts numbers to *" do
    list = [some_word: 4, word: 3, another_word: 2]
    assert WordCount.create_histogram(list) == ["some_word: ****", "word: ***", "another_word: **"]
  end
end
