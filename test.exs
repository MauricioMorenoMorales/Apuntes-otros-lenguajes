defmodule T do

  def majority_element nums do
    nums
    |> Enum.frequencies
    |> Enum.map(fn {key, val} -> {val, key} end)
    |> Enum.max
    |> Tuple.to_list
    |> Enum.at(1)
  end

  def majority_elements_m nums do
    nums
    |> Enum.frequencies
    |> Enum.max_by(fn {n, c} -> c end)
    |> elem(0)
  end

  def longest_common_prefix strings do
    strings
    |> Enum.map(&)
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
    logTest 1, 3, &majorityElement/1, [[3,2,3]]
    logTest 2, 2, &majorityElement/1, [[2,2,1,1,1,2,2]]
    logTest 3, 3, &majorityElement/1, [[3,3,4]]
  end
end
