defmodule T do

  # def majority_element nums do
  #   nums
  #   |> Enum.frequencies
  #   |> Enum.map(fn {key, val} -> {val, key} end)
  #   |> Enum.max
  #   |> Tuple.to_list
  #   |> Enum.at(1)
  # end

  # def majority_elements_m nums do
  #   nums
  #   |> Enum.frequencies
  #   |> Enum.max_by(fn {n, c} -> c end)
  #   |> elem(0)
  # end

  # def longest_common_prefix strings do
  #   strings
  #   |> Enum.map(&String.to_charlist/1) # [~c"flower", ~c"flow", ~c"flight"]
  #   |> Enum.zip # [{102, 102, 102}, {108, 108, 108}, {111, 111, 105}, {119, 119, 103}]
  #   |> Enum.map(&Tuple.to_list/1) # [~c"fff", ~c"lll", ~c"ooi", ~c"wwg"]
  #   |> Enum.map(&Enum.uniq/1) # [~c"f", ~c"l", ~c"oi", ~c"wg"]
  #   |> Enum.take_while(&match?([_], &1)) # [~c"f", ~c"l"]
  #   |> IO.iodata_to_binary # "fl"
  # end

  # def longest_common_prefix_r(strings), do: strings |> Enum.reduce(&take_while_eq/2)
  # defp take_while_eq(str1, str2, acc \\ "")
  # defp take_while_eq(
  #   <<l1::binary-size(1), rest1::bitstring()>>,
  #   <<l2::binary-size(1), rest2::bitstring()>>,
  #   acc)
  # when l1 == l2 do
  #   take_while_eq(rest1, rest2, acc <> l1)
  # end
  # def take_while_eq(_,_, acc), do: acc

  def generate rows do
    if rows = 1 do
      [[1]]
    else
      make_pascal_row([[1, 1],[1]], [], [1, 1], rows) |> Enum.reverse
    end
  end

  @spec make_pascal_row(
    response    ::[[integer]],
    accumulator :: [integer],
    current     :: [integer],
    remaining   :: integer) :: [[integer]]
  def make_pascal_row(response, accumulator, current, remaining)
  def make_pascal_row(response, _, _, 2), do: response
  def make_pascal_row(response, accumulator, [1], rows)do
    make_pascal_row([accumulator|response], [], accumulator, rows - 1)
  end
  def make_pascal_row(response, accumulator, [c1|[c2|ctail]], rows) do
    make_pascal_row(response, [c1+c2|accumulator], [c2|ctail], rows)
  end

  def two_sum(nums, target) do
    nums
    |> Enum.with_index()
    |> Enum.reduce_while(%{}, fn {num, index}, acc ->
    diff = target - num

    if Map.has_key?(acc, diff) do
      {:halt, [Map.get(acc, diff), index]}
    else
      {:cont, Map.put(acc, num, index)}
    end
    end)
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
    # logTest 1, 3, &majorityElement/1, [[3,2,3]]
    # logTest 2, 2, &majorityElement/1, [[2,2,1,1,1,2,2]]
    # logTest 3, 3, &majorityElement/1, [[3,3,4]]

    # logTest 1, "fl", &longest_common_prefix/1, [["flower","flow","flight"]]

    # logTest 1, [[1,1], [1]], &generate/1, 2
    logTest 2, [[1]], &generate/1, 2
  end
end
