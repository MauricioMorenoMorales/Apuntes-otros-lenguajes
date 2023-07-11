defmodule Array do
  @spec contains_duplicate(nums :: [integer]) :: boolean
  def contains_duplicate nums do
    list_without_repetitions_size = nums |> Enum.uniq |> Enum.count
    list_size = Enum.count nums
    list_size !== list_without_repetitions_size
  end

  # --- Speed
  @spec contains_duplicate_s(nums :: [integer]) :: boolean
  def contains_duplicate_s nums do
    check_duplicates(Enum.sort(nums))
  end

  defp check_duplicats([]), do: false
  defp check_duplicates([_]), do: false
  defp check_duplicates([h | [h | t]]), do: true
  defp check_duplicates([h1 | [h2 | t]=tail]), do: check_duplicates(tail)

  # --- Memory
  @spec contains_duplicate_m(nums :: [integer]) :: boolean
  def contains_duplicate_m nums do
    recursion(nums, %{})
  end

  defp recursion([], _map), do: false
  defp recursion([h | tail], map) do
    if map[h] do
      true
    else
      recursive(tail, Map.put(map, h, true))
    end
  end


  #! ------------------------------------------
  @spec is_anagram(s :: String.t, t :: String.t) :: boolean
  def is_anagram(s, t) do
    sorted_s = s |> String.split("") |> Enum.sort
    sorted_t = t |> String.split("") |> Enum.sort
    sorted_s == sorted_t
  end

  # --- Speed
  def is_anagram_s(s, t) do
    (s |> String.to_charlist |> Enum.frequencies) ==
    (t |> String.to_charlist |> Enum.frequencies)
  end

  # --- Memory <<<
  def is_anagram(s, t), do: extract(s) == extract(t)

  defp extract(word, m \\ %{})
  defp extract(<<>>, m), do: m
  defp extract(<<h :: utf8, t :: binary>>, m) when not is_map_key(m, h), do extract(t, Map.put(m, h, 1))
  defp extract(<<h :: utf8, t :: binary>>, m), do: extract(t, Map.put(m, h, Map.get(m, h) + 1))
  #! ---------------------------------------

  def replaceElements arr do
    arr |> Enum.reverse |> recursion(-1, [])
  end

  defp recursion([], _current_max, accumulator), do: accumulator
  defp recursion([head | tail], current_max, accumulator) do
    maximum_value = if head > current_max do head else current_max end
    recursion([tail], maximum_value, [maximum_value | accumulator])
  end
end

#! Retorna el valor a la derecha mas grande

def replaceElements arr do
  arr |> Enum.reverse |> recursion
end

defp recursion([], _, [_ | tail]), do: Enum.concat tail, [-1]
defp recursion([head | tail], current_max \\ -1, accumulator \\ []) do
  maximum_value = max head, current_max
  recursion tail, maximum_value, [maximum_value | accumulator]
end

# Optimizacion

def replaceElements arr do
  arr |> Enum.reverse |> reduce([], -1)
end

defp reduce([], res, _), do: res
defp reduce([head|tail], res, previous_max) do
  reduce tail, [previous_max|res], max(previous_max, head)
end
