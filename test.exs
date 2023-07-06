defmodule T do

  def contains_duplicate nums do
    list_without_repetitions_size = nums |> Enum.uniq |> Enum.count
    list_size = Enum.count nums
    list_size !== list_without_repetitions_size
  end

  def is_anagram(s, t) do
    sorted_s = s |> String.split("") |> Enum.sort
    sorted_t = t |> String.split("") |> Enum.sort
    sorted_s == sorted_t
  end

#!######################################################################
  defp logTest(id, correct, function, parameters) do
    result = apply function, parameters
    IO.inspect id
    if result !== correct do
    IO.puts "---------------------------------------------"
    IO.inspect parameters
    IO.inspect result
    IO.puts "Received ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    IO.puts "Correct vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
    IO.inspect correct
    IO.puts "--------------------------------------------  "
    else
      IO.puts "√√√"
    end
  end
  def t do
    logTest 1, true, &contains_duplicate/1, [[1,2,3,1]]
    logTest 2, false, &contains_duplicate/1, [[1,2,3,4]]
    logTest 3, true, &contains_duplicate/1, [[1,1,1,3,3,4,3,2,4,2]]

    logTest 1, true, &is_anagram/2, ["anagram", "nagaram"]
    logTest 2, false, &is_anagram/2, ["rat", "car"]
  end
end
