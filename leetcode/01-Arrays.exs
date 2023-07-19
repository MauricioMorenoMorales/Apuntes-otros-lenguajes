defmodule Array do
  alias Mix.Tasks.Lsp.Mappings
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

  #! Determina si los las letras de un string son incluidas en otro array en el mismo orden

  def is_subsequence(s, t), do: check(s |> String.to_charlist, t |> String.to_charlist)

  def check([], _t), do: true
  def check(_s, []), do: false
  def check([s_h|s_t], [t_h|t_t]) when s_h == t_h, do: check(s_t, t_t)
  def check(s, [_|t_t]), do: check(s, t_t)

  #? Speed version
  def is_subsequence_s("", _t), do: true
  def is_subsequence_s(_s, ""), do: false
  def is_subsequence(<<_c::8, s::binary>>, <<c::8, t::binary>>), do: is_subsequence_s(s, t)
  def is_subsequence(s, <<_::8, t::binary>>), do: is_subsequence_s(s, t)

  #? Memory version
  def is_subsequence_m(s, t), do: check_m(s |> String.to_charlist, t |> String.to_charlist)

  def check_m([], _t), do: true
  def check_m(_s, []), do: false
  def check_m(s=[s_h|s_t], [t_h|t_t]) do
    cond do
      s_h == t_h -> check_m(s_t, t_t)
      true -> check_m(s, t_t)
    end
  end

  #! Isomorfic strings

  @spec is_isomorphic(s :: String.t, t :: String.t) :: boolean
  def is_isomorphic(s, t) do
    if String.length(s) != String.length(t) do
      false
    else
      can_morph(%{}, Mapset.new(), String.to_charlist(s), String.to_charlist(t))
    end
  end

  defp can_morph(_, _, [], []), do: true

  def can_morph(mappings, domain, [x|xtail], [y|ytail]) do
    existing = mappings[x]

    cond do
      existing == nil && not MapSet.member?(domain, y) ->
        can_morph(Map.put(mappings, x, y), MapSet.put(domain, y), xtail, ytail)
      existing == y ->
        can_morph(mappings, domain, xtail, ytail)
      true -> false
    end
  end

  #! Most common element in a string

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


end
