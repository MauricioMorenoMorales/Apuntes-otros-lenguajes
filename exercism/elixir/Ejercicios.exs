# ejercicio lasagna de guido numbers

defmodule Lasagna do
  @cooking_time 40

  def expected_minutes_in_oven, do: @cooking_time

  @spec remaining_minutes_in_oven(number) :: number
  def remaining_minutes_in_oven(time), do: @cooking_time - time

  @spec preparation_time_in_minutes(number) :: number
  def preparation_time_in_minutes(layers), do: layers * 2

  @spec total_time_in_minutes(number, number) :: number
  def total_time_in_minutes(layers, ovenTime), do: (layers * 2) + ovenTime

  @spec alarm :: <<_::40>>
  def alarm, do: "Ding!"
end

# Booleanos

defmodule Rules do
  @spec eat_ghost?(boolean, boolean) :: boolean
  def eat_ghost?(power_pellet_active, touching_ghost) do
    power_pellet_active and touching_ghost
  end

  @spec score?(boolean, boolean) :: boolean
  def score?(touching_power_pellet, touching_dot) do
    touching_power_pellet or touching_dot
  end



  @spec lose?(boolean, boolean) :: boolean
  def lose?(power_pellet_active, touching_ghost) do
    is_posible_to_lose = not power_pellet_active
    is_posible_to_lose and touching_ghost
  end

  @spec win?(boolean, boolean, boolean) :: boolean
  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    has_eaten_all_dots and not lose?(power_pellet_active, touching_ghost)
  end
end

defmodule Rules2 do
  @spec eat_ghost?(boolean, boolean) :: boolean
  def eat_ghost?(true, true), do: true
  def eat_ghost?(power_pellet_active, touching_ghost), do: false

  @spec score?(boolean, boolean) :: boolean
  def score?(false, false), do: false
  def score?(touching_power_pellet, touching_dot), do: true

  @spec lose?(boolean, boolean) :: boolean
  def lose?(false, true), do: true
  def lose?(power_pellet_active, touching_ghost), do: false

  @spec win?(boolean, boolean, boolean) :: boolean
  def win?(false, _, _), do: false
  def win?(true, false, true), do: false
  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost), do: true
end

# ! Manipulacion de arrays lists arrays

defmodule LanguageList do
  def new, do: []

  def add(list, language), do: [language | list]

  def remove(list) do
    [_ | tail] = list
    tail
  end

  def first(list) do
    [head | _] = list
    head
  end

  def count(list), do: length(list)

  def exciting_list?(list) do
    Enum.any?(list, fn element -> element == "Elixir" end)
  end
end

defmodule LanguageList2 do
  def new, do: []

  def add(list, language), do: [language | list]

  def remove([_ | tail]), do: tail

  def first([head | _]), do: head

  def count([]), do: 0
  def count([_h | t]), do: 1 + count(t)

  def exciting_list?(list), do: "Elixir" in list
end

defmodule LanguageList3 do
  def new, do: []

  def add(list, language), do: [language | list]

  def remove(list), do: list |> tl

  def first(list), do: list |> hd

  def count(list), do: list |> length

  def exciting_list?(list), do: "Elixir" in list
end

# Closures

defmodule Secrets2 do
  def secret_add secret do
    fn number -> secret + number end
  end

  def secret_subtract(secret) do
    fn number -> number - secret end
  end

  def secret_multiply(secret) do
    fn number -> secret * number end
  end

  def secret_divide(secret) do
    fn number -> number / secret |> trunc end
  end

  def secret_and(secret) do
    fn number -> Bitwise.&&&(secret, number) end
  end

  def secret_xor(secret) do
    fn number -> Bitwise.^^^(secret, number) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn number -> number |> secret_function1.() |> secret_function2.() end
  end
end

defmodule Secrets do
  use Bitwise, only_operators: true
  def secret_add(secret), do: fn number -> number + secret end

  def secret_subtract(secret), do: &(&1 - secret)

  def secret_multiply(secret), do: &(&1 * secret)

  def secret_divide(secret) when secret != 0, do: &(&1 / secret |> trunc)

  def secret_and(secret), do: &(&1 &&& secret)

  def secret_xor(secret), do: &(&1 ^^^ secret)

  def secret_combine(secret_function1, secret_function2) do
    &(&1 |> secret_function1.() |> secret_function2.())
  end
end

# ifs cond atoms

defmodule LogLevel do
  @spec to_label(number, boolean) ::
      :debug
    | :error
    | :fatal
    | :info
    | :trace
    | :unknown
    | :warning
  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 0 and legacy? -> :unknown
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      level == 5 and legacy? -> :unknown
      true -> :unknown
    end
  end

  @spec alert_recipient(number, boolean) :: :dev1 | :dev2 | nil | :ops
  def alert_recipient(level, legacy?) do
    message = to_label(level, legacy?)
    cond do
      message == :error -> :ops
      message == :fatal -> :ops
      message == :unknown and legacy? -> :dev1
      message == :unknown and not legacy? -> :dev2
      true -> nil
    end
  end
end

# cuando encuentres que se repite una respuesta en este caso unknown, puedes mezclarla con
# la respuesta por defecto
defmodule LogLevel2 do
  @spec to_label(number, boolean) ::
      :debug
    | :error
    | :fatal
    | :info
    | :trace
    | :unknown
    | :warning
  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      true -> :unknown
    end
  end

  @spec alert_recipient(number, boolean) :: :dev1 | :dev2 | nil | :ops
  def alert_recipient(level, legacy?) do
    message = to_label(level, legacy?)
    cond do
      message in [:error, :fatal] -> :ops
      message == :unknown and legacy? -> :dev1
      message == :unknown and not legacy? -> :dev2
      true -> nil
    end
  end
end

defmodule LogLevel3 do
  def to_label(level, legacy?), do: do_to_label(level, legacy?)

  defp do_to_label(0, false), do: :trace
  defp do_to_label(1, _), do: :debug
  defp do_to_label(2, _), do: :info
  defp do_to_label(3, _), do: :warning
  defp do_to_label(4, _), do: :error
  defp do_to_label(5, false), do: :fatal
  defp do_to_label(_, _), do: :unknown

  def alert_recipient(level, legacy?) do
    level |> to_label(legacy?) |> do_alert_recipient(legacy?)
  end

  defp do_alert_recipient(:error, _), do: :ops
  defp do_alert_recipient(:fatal, _), do: :ops
  defp do_alert_recipient(:unknown, true), do: :dev1
  defp do_alert_recipient(:unknown, false), do: :dev2
  defp do_alert_recipient(_, _), do: false
end


defmodule LogLevel4 do
  @spec to_label(number, boolean) ::
      :debug
    | :error
    | :fatal
    | :info
    | :trace
    | :unknown
    | :warning
  def to_label(level, legacy?) do
    case {level, legacy?} do
      {0, false} -> :trace
      {1, _} -> :debug
      {2, _} -> :info
      {3, _} -> :warning
      {4, _} -> :error
      {5, false} -> :fatal
      _ -> :unknown
    end
  end

  @spec alert_recipient(number, boolean) :: :dev1 | :dev2 | false | :ops
  def alert_recipient(level, legacy?) do
    message = to_label(level, legacy?)
    cond do
      message in [:error, :fatal] -> :ops
      message == :unknown and legacy? -> :dev1
      message == :unknown -> :dev2
      true -> false
    end
  end
end

# Guardas

defmodule GuessingGame do
  @spec compare(number) :: <<_::96>>
  @spec compare(number, any) :: <<_::56, _::_*8>>
  def compare(_), do: "Make a guess"
  def compare(_, guess) when not is_integer(guess), do: "Make a guess"
  def compare(secret_number, guess) do
    cond do
      secret_number - guess == 1 or guess - secret_number == 1 -> "So close"
      secret_number < guess -> "Too high"
      secret_number > guess -> "Too low"
      secret_number == guess -> "Correct"
    end
  end
end

defmodule GuessingGame2 do
  @spec compare(number, any) :: <<_::56, _::_*8>>
  def compare(secret_number, guess \\ :no_guess)
  def compare(_, :no_guess), do: "Make a guess"
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when abs(secret_number - guess) == 1, do: "So close"
  def compare(secret_number, guess) when secret_number < guess, do: "Too high"
  def compare(secret_number, guess) when secret_number > guess, do: "Too low"
end

#! Pattern matching convertidor de unidades

defmodule KitchenCalculator do
  @spec get_volume({any, number}) :: number
  def get_volume({_, volume}), do: volume

  @spec to_milliliter(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, any}
          | {:tablespoon, number}
          | {:teaspoon, number}
        ) :: {:milliliter, any}
  def to_milliliter({:milliliter, number}), do: {:milliliter, number}
  def to_milliliter({:cup, number}), do: {:milliliter, number * 240}
  def to_milliliter({:fluid_ounce, number}), do: {:milliliter, number * 30}
  def to_milliliter({:teaspoon, number}), do: {:milliliter, number * 5}
  def to_milliliter({:tablespoon, number}), do: {:milliliter, number * 15}

  @spec from_milliliter(
          {:milliliter, any},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, any}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def from_milliliter({:milliliter, number}, :milliliter), do: {:milliliter, number}
  def from_milliliter({:milliliter, number}, :cup), do: {:cup, number / 240}
  def from_milliliter({:milliliter, number}, :fluid_ounce), do: {:fluid_ounce, number / 30}
  def from_milliliter({:milliliter, number}, :teaspoon), do: {:teaspoon, number / 5}
  def from_milliliter({:milliliter, number}, :tablespoon), do: {:tablespoon, number / 15}

  @spec convert(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, any}
          | {:tablespoon, number}
          | {:teaspoon, number},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, any}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def convert(volume_pair, unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)
end

defmodule KitchenCalculator2 do
  @ratios %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }

  @spec get_volume({any, number}) :: number
  def get_volume({_unit, volume}), do: volume

  @spec to_milliliter(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, any}
          | {:tablespoon, number}
          | {:teaspoon, number}
        ) :: {:milliliter, any}
  def to_milliliter({unit, volume}), do: {:milliliter, volume * @ratios[unit]}

  @spec from_milliliter(
          {:milliliter, any},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, any}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def from_milliliter({:milliliter, number}, unit), do: {unit, number / @ratios[unit]}

  @spec convert(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, any}
          | {:tablespoon, number}
          | {:teaspoon, number},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, any}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter |> from_milliliter(unit)
  end
end

defmodule KitchenCalculator3 do
  @spec factor(
    :cup
    |:fluid_ounce
    |:teaspoon
    |:tablespoon
    |:milliliter
  ) :: number
  defp factor unit do
    case {unit} do
      {:cup} -> 240
      {:fluid_ounce} -> 30
      {:teaspoon} -> 5
      {:tablespoon} -> 15
      {:milliliter} -> 1
    end
  end

  @spec get_volume({any, number}) :: number
  def get_volume({_unit, volume}), do: volume

  @spec to_milliliter(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, any}
          | {:tablespoon, number}
          | {:teaspoon, number}
        ) :: {:milliliter, any}
  def to_milliliter({unit, volume}), do: {:milliliter, volume * factor(unit)}

  @spec from_milliliter(
          {:milliliter, any},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, any}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def from_milliliter({:milliliter, number}, unit), do: {unit, number / factor(unit)}

  @spec convert(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, any}
          | {:tablespoon, number}
          | {:teaspoon, number},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, any}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def convert(volume_pair, unit) do
    # also you can: {unit, volume * factor(base_unit) / factor(unit)}
    volume_pair |> to_milliliter |> from_milliliter unit
  end
end

# String interpolation and pipe operator

defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim
    |> String.first
  end

  def initial(name) do
    letter = name
    |> String.trim
    |> first_letter
    |> String.upcase
    "#{letter}."
  end

  def initials(full_name) do
    [first_name, last_name] = full_name |> String.split
    "#{initial first_name} #{initial last_name}"
  end

  def pair(full_name1, full_name2) do
    initials1 = initials full_name1
    initials2 = initials full_name2
    string = "#{initials1}  +  #{initials2}"
    "     ******       ******\n   **      **   **      **\n **         ** **         **\n**            *            **\n**                         **\n**     #{string}     **\n **                       **\n   **                   **\n     **               **\n       **           **\n         **       **\n           **   **\n             ***\n              *\n"
    #      ******       ******
    #    **      **   **      **
    #  **         ** **         **
    # **            *            **
    # **                         **
    # **     X. X.  +  X. X.     **
    #  **                       **
    #    **                   **
    #      **               **
    #        **           **
    #          **       **
    #            **   **
    #              ***
    #               *
  end
end

defmodule HighSchoolSweetheart2 do
  def first_letter(name) do
    name
    |> String.trim
    |> String.first
  end

  def initial(name) do
    name
    |> String.trim
    |> first_letter
    |> String.upcase
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    full_name
    |> String.split
    |> Enum.map(fn element -> initial element end)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    initials1 = initials full_name1
    initials2 = initials full_name2
    string = "#{initials1}  +  #{initials2}"
    "     ******       ******\n   **      **   **      **\n **         ** **         **\n**            *            **\n**                         **\n**     #{string}     **\n **                       **\n   **                   **\n     **               **\n       **           **\n         **       **\n           **   **\n             ***\n              *\n"
    #      ******       ******
    #    **      **   **      **
    #  **         ** **         **
    # **            *            **
    # **                         **
    # **     X. X.  +  X. X.     **
    #  **                       **
    #    **                   **
    #      **               **
    #        **           **
    #          **       **
    #            **   **
    #              ***
    #               *
  end
end

# Recursividad
defmodule BirdCount do
  def today([]), do: nil
  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([head | tail]) do
    cond do
      head == 0 -> true
      true -> has_day_without_birds? tail
    end
  end

  def total([]), do: 0
  def total([head | tail]), do: head + total tail

  def busy_days([]), do: 0
  def busy_days([head | tail]) do
    cond do
      head >= 5 -> 1 + busy_days tail
      true -> 0 + busy_days tail
    end
  end
end

defmodule BirdCount2 do
  @spec today(maybe_improper_list) :: any
  def today([]), do: nil
  def today([head | _tail]), do: head

  @spec increment_day_count(maybe_improper_list) :: nonempty_maybe_improper_list
  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  @spec has_day_without_birds?(maybe_improper_list) :: boolean
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds? tail

  @spec total([number]) :: number
  def total([]), do: 0
  def total([head | tail]), do: head + total tail

  @spec busy_days(list) :: non_neg_integer
  def busy_days([]), do: 0
  def busy_days([head | tail]) when head >= 5, do: 1 + busy_days tail
  def busy_days([_head | tail]), do: busy_days tail
end

#? no recursivo
defmodule BirdCount3 do
  @spec today(maybe_improper_list) :: any
  def today([]), do: nil
  def today([head | _tail]), do: head

  @spec increment_day_count(maybe_improper_list) :: nonempty_maybe_improper_list
  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  @spec has_day_without_birds?(maybe_improper_list) :: boolean
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds? tail

  @spec total([number]) :: number
  def total(list), do: list |> Enum.sum

  @spec busy_days(list) :: non_neg_integer
  def busy_days(list), do: list |> Enum.filter(fn e -> e >= 5 end) |> length
end

#! Maps manipulation

defmodule HighScore do
  @initial_score 0
  @spec new :: %{}
  def new, do: %{}

  @spec add_player(map, string, number) :: map
  def add_player(scores, name, score \\ @initial_score), do: scores |> Map.put(name, score)

  @spec remove_player(map, string) :: map
  def remove_player(scores, name), do: scores |> Map.delete(name)

  @spec reset_score(map, string) :: map
  def reset_score(scores, name), do: scores |> Map.put(name, @initial_score)

  @spec update_score(map, string, number) :: map
  def update_score(scores, name, score), do: scores |> Map.update(name, score, fn existing_value -> existing_value + score end)

  @spec get_players(map) :: list
  def get_players(scores), do: scores |> Map.keys
end

defmodule HighScore2 do
  @initial_score 0
  @spec new :: %{}
  def new, do: %{}

  @spec add_player(map, string, number) :: map
  def add_player(scores, name, score \\ @initial_score), do: scores |> Map.put(name, score)

  @spec remove_player(map, string) :: map
  def remove_player(scores, name), do: scores |> Map.delete(name)

  @spec reset_score(map, string) :: map
  def reset_score(scores, name), do: scores |> Map.put(name, @initial_score)

  @spec update_score(map, string, number) :: map
  def update_score(scores, name, score) do
    old_score = scores |> Map.get(name, @initial_score)
    scores |> Map.put(name, old_score + score)
  end

  @spec get_players(map) :: list
  def get_players(scores), do: scores |> Map.keys
end

defmodule HighScore do
  @initial_score 0
  @spec new :: %{}
  def new, do: %{}

  @spec add_player(map, string, number) :: map
  def add_player(scores, name, score \\ @initial_score), do: scores |> Map.put(name, score)

  @spec remove_player(map, string) :: map
  def remove_player(scores, name), do: scores |> Map.delete(name)

  @spec reset_score(map, string) :: map
  def reset_score(scores, name), do: scores |> Map.put(name, @initial_score)

  @spec update_score(map, string, number) :: map
  def update_score(scores, name, score) do
    if scores |> Map.has_key?(name) do
      scores |> Map.replace(name, scores[name] + score)
    else
      scores |> add_player(name, score)
    end
  end

  @spec get_players(map) :: list
  def get_players(scores), do: scores |> Map.keys
end

# Types typescpecs

# puedes crear un tipo de esta manera
# @type color :: {hue :: integer, saturation :: integer, lightness :: integer}
# @spec to_hex(color()) :: String.t()

defmodule Form do
  @moduledoc """
  A collection of loosely related functions helpful for filling out various forms at the city office.
  """

  @doc """
  Generates a string of a given length.

  This string can be used to fill out a form field that is supposed to have no value.
  Such fields cannot be left empty because a malicious third party could fill them out with false data.
  """
  @spec blanks(n :: non_neg_integer()) :: String.t()
  def blanks(n) do
    String.duplicate("X", n)
  end

  @doc """
  Splits the string into a list of uppercase letters.

  This is needed for form fields that don't offer a single input for the whole string,
  but instead require splitting the string into a predefined number of single-letter inputs.
  """
  @spec letters(word :: String.t()) :: list(String.t())
  def letters(word) do
    word
    |> String.upcase()
    |> String.split("", trim: true)
  end

  @doc """
  Checks if the value has no more than the maximum allowed number of letters.

  This is needed to check that the values of fields do not exceed the maximum allowed length.
  It also tells you by how much the value exceeds the maximum.
  """
  @spec check_length(
    word :: String.t(),
    length :: non_neg_integer()
  ) :: :ok | {:error, pos_integer()}
  def check_length(word, length) do
    diff = String.length(word) - length

    if diff <= 0 do
      :ok
    else
      {:error, diff}
    end
  end
  @type address_map :: %{street: String.t, postal_code: String.t, city: String.t}
  @type address_tuple :: {street :: String.t, postal_code :: String.t, city :: String.t}
  @type address :: address_map() | address_tuple()

  @doc """
  Formats the address as an uppercase multiline string.
  """
  @spec format_address(address) :: String.t()
  def format_address(%{street: street, postal_code: postal_code, city: city}) do
    format_address({street, postal_code, city})
  end

  def format_address({street, postal_code, city}) do
    """
    #{String.upcase(street)}
    #{String.upcase(postal_code)} #{String.upcase(city)}
    """
  end
end

#! charlists, recursion filter map

defmodule Username do
	@spec sanitize(username :: charlist()) :: charlist()
	def sanitize([]), do: []
	def sanitize([head | tail]) do
		case head do
			head when head >= 97 and head <= 122 -> [head|sanitize(tail)]
			head when head ==  95 -> [head|sanitize(tail)]
			head when head == 252 -> [117,101|sanitize(tail)] #ü -> ae
			head when head == 246 -> [111,101|sanitize(tail)] #ö -> oe
			head when head == 228 -> [97,101|sanitize(tail)] #ö -> ue
			head when head == 223 -> [115,115|sanitize(tail)] #ß -> ss
			_ -> sanitize(tail)
		end
	end
end

defmodule Username do
  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    case head do
      head when head in ?a..?z -> [head|sanitize(tail)]
      ?_ -> [head|sanitize(tail)]
      ?ü -> [?u,?e|sanitize(tail)]
      ?ö -> [?o,?e|sanitize(tail)]
      ?ä -> [?a,?e|sanitize(tail)]
      ?ß -> [?s,?s|sanitize(tail)]
      _ -> sanitize(tail)
    end
  end
end

# reduce
defmodule Username do
  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize username do
    username |> Enum.reduce('', fn c, acc ->
      acc ++ case c do
        ?_ -> '_'
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ß -> 'ss'
        ?ü -> 'ue'
        c when c in ?a..?z -> [c]
        _ -> ''
      end
    end)
  end
end

defmodule Username do
  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize(''), do: ''
  def sanitize([head|tail]) do
    sanitized =
      case head do
        ?ß -> 'ss'
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?_ -> '_'
        x when x >= ?a and x <= ?z -> [x]
      end
    sanitized ++ sanitize(tail)
  end
end
#defguards simplified functions

defmodule Username do
  defguard is_lowercase(codepoint) when codepoint in ?a..?z
  defguard is_underscore(codepoint) when codepoint == ?_

  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize username do
    username
      |> Enum.map(&substitute_german_chars/1)
      |> List.flatten
      |> Enum.filter(&(is_lowercase(&1) or is_underscore(&1)))
  end

  defp substitute_german_chars codepoint do
    case codepoint do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> codepoint
    end
  end
end

#! Regex, date parser

defmodule DateParser do
  def day(), do: "([1-9]|[0][1-9]|[12][0-9]|3[01])"

  def month(), do: "([1-9]|0[1-9]|1[12])"

  def year(), do: "([12]{1}[0-9]{3})"

  def day_names(), do: "(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday)"

  def month_names do
    "(January|February|March|April|May|June|July|August|September|October|November|December)"
  end
  def capture_day(), do: "(?<day>#{day()})"

  def capture_month(), do: "(?<month>#{month()})"

  def capture_year(), do: "(?<year>#{year()})"

  def capture_day_name(), do: "(?<day_name>#{day_names()})"

  def capture_month_name(), do: "(?<month_name>#{month_names()})"

  def capture_numeric_date do
    "(#{capture_day()}/#{capture_month()}/#{capture_year()})"
  end

  def capture_month_name_date do
    "(#{capture_month_name()} #{capture_day()}, #{capture_year()})"
  end

  def capture_day_month_name_date do
    "(#{capture_day_name()}, #{capture_month_name()} #{capture_day()}, #{capture_year()})"
  end

  def match_numeric_date(), do: ~r/^#{capture_numeric_date()}$/

  def match_month_name_date(), do: ~r/^#{capture_month_name_date()}$/

  def match_day_month_name_date(), do: ~r/^#{capture_day_month_name_date()}$/
end

defmodule DateParser do
  @moduledoc """
  Module provides a set of functions to parse various date formats.
  """
  @day_names ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  @month_names ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  @doc """
  Returns a regex string which matches a day number.
  """
  @spec day() :: String.t()
  def day(), do: "\\d{1,2}"
  @doc """
  Returns a regex string which matches a month number.
  """
  @spec month() :: String.t()
  def month(), do: "\\d{1,2}"
  @doc """
  Returns a regex string which matches a year number.
  """
  @spec year() :: String.t()
  def year(), do: "\\d{4}"
  @doc """
  Returns a regex string which matches a day name.
  """
  @spec day_names() :: String.t()
  def day_names(), do: "(" <> Enum.join(@day_names, "|") <> ")"
  @doc """
  Returns a regex string which matches a month name.
  """
  @spec month_names() :: String.t()
  def month_names(), do: "(" <> Enum.join(@month_names, "|") <> ")"
  @doc """
  Returns a string pattern which captures the day number.
  """
  @spec capture_day() :: String.t()
  def capture_day(), do: "(?P<day>#{day()})"
  @doc """
  Returns a string pattern which captures the month number.
  """
  @spec capture_month() :: String.t()
  def capture_month(), do: "(?P<month>#{month()})"
  @doc """
  Returns a string pattern which captures the year number.
  """
  @spec capture_year() :: String.t()
  def capture_year(), do: "(?P<year>#{year()})"
  @doc """
  Returns a string pattern which captures the day name.
  """
  @spec capture_day_name() :: String.t()
  def capture_day_name(), do: "(?P<day_name>#{day_names()})"
  @doc """
  Returns a string pattern which captures the month name.
  """
  @spec capture_month_name() :: String.t()
  def capture_month_name(), do: "(?P<month_name>#{month_names()})"
  @doc """
  Returns a string pattern which captures numeric date format.
  """
  @spec capture_numeric_date() :: String.t()
  def capture_numeric_date(), do: "#{capture_day()}/#{capture_month()}/#{capture_year()}"
  @doc """
  Returns a string pattern which captures month name date format.
  """
  @spec capture_month_name_date() :: String.t()
  def capture_month_name_date(), do: "#{capture_month_name()} #{capture_day()}, #{capture_year()}"
  @doc """
  Returns a string pattern which captures day month name date format.
  """
  @spec capture_day_month_name_date() :: String.t()
  def capture_day_month_name_date(), do: "#{capture_day_name()}, #{capture_month_name()} #{capture_day()}, #{capture_year()}"
  @doc """
  Returns a compiled regular expression that only matches the numeric date format,
  and which can also capture the date's components.
  """
  @spec match_numeric_date() :: Regex.t()
  def match_numeric_date(), do: ~r/^#{capture_numeric_date()}$/
  @doc """
  Returns a compiled regular expression that only matches the month name date format,
  and which can also capture the date's components.
  """
  @spec match_month_name_date() :: Regex.t()
  def match_month_name_date(), do: ~r/^#{capture_month_name_date()}$/
  @doc """
  Returns a compiled regular expression that only matches the day month name date format,
  and which can also capture the date's components.
  """
  @spec match_day_month_name_date() :: Regex.t()
  def match_day_month_name_date(), do: ~r/^#{capture_day_month_name_date()}$/
end

#! Ifs simplified functions

defmodule NameBadge do
  def print(id, name, department) do
    department_name = if(department, do: String.upcase(department), else: "OWNER")
    if id do
      "[#{id}] - #{name} - #{department_name}"
    else
      "#{name} - #{department_name}"
    end
  end
end

defmodule NameBadge do
  def print(id, name, department) do
    department = if department, do: String.upcase(department), else: "OWNER"
    prefix = if id, do: "[#{id}] - ", else: ""
    prefix <> "#{name} - #{department}"
  end
end

defmodule NameBadge do
  @owner_dep "OWNER"
  @separator " - "
  def print(id, name, department) do
    prefix = if id, do: "[#{id}]"
    department = if department, do: String.upcase(department), else: @owner_dep
    [prefix, name, department] |> Enum.reject(&is_nil/1) |> Enum.join(@separator)
  end
end

#! Procesos, manten un proceso vivo y cada vez quelo llamen, retorna determinadas cosas
#? mal
# defmodule TakeANumber do
#   def start() do
#     spawn(fn ->
#       receive do
#         {:report_state, sender_pid} -> send(sender_pid, 0)
#         :do_nothing -> nil
#       after
#         1_000 -> "Nothing has appened"
#       end
#     end)
#   end
# end

defmodule TakeANumber do
  def start, do: spawn(fn -> loop(0) end)
  def loop state do
    receive do
      {:report_state, pid} ->
        send(pid, state)
        loop(state)
      {:take_a_number, pid} ->
        send(pid, state + 1)
        loop(state + 1)
      :stop -> :ok
      _ -> loop(state)
    end
  end
end

defmodule TakeANumber do
  @initial_state 0
  @state_key :ticket_number

  def start, do: spawn(fn -> handler end)

  defp handler do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, get_ticket())
      {:take_a_number, sender_pid} ->
        next_ticket = get_ticket() + 1
        send(sender_pid, next_ticket)
        Process.put(@state_key, next_ticket)
      :stop -> exit(:stop)
      _ -> nil
    end
    handler()
  end

  defp get_ticket, do: Process.get(@state_key, @initial_state)
end

#! Realiza las operaciones basicas de la consola en el objeto IO

defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts "Welcome! Let's fill out your character sheet together."
  end

  def ask_name() do
    input = IO.gets "What is your character's name?\n"
    input |> String.trim
  end

  def ask_class() do
    input = IO.gets "What is your character's class?\n"
    input |> String.trim
  end

  def ask_level() do
    input = IO.gets "What is your character's level?\n"
    input |> String.trim |> String.to_integer
  end

  def run() do
    IO.puts "Welcome! Let's fill out your character sheet together."
    name = ask_name()
    class = ask_class()
    level = ask_level()
    character = %{class: class, level: level, name: name}
    IO.inspect(character, label: "Your character" )
    character
  end
end

defmodule RPG.CharacterSheet do
  @spec welcome() :: :ok
  def welcome, do: IO.puts("Welcome! Let's fill out your character sheet together.")

  @spec ask_name() :: String.t()
  def ask_name, do:
    IO.gets("What is your character's name?\n")
    |> String.trim()

    @spec ask_class() :: String.t()
  def ask_class(), do:
    IO.gets("What is your character's class?\n")
    |> String.trim()

  @spec ask_level() :: String.t()
  def ask_level, do:
    IO.gets("What is your character's level?\n")
    |> String.trim()
    |> String.to_integer()

  def run do
    welcome()
    %{name: ask_name(), class: ask_class(), level: ask_level()}
    |> IO.inspect(label: "Your character: ")
  end
end

defmodule RPG.CharacterSheet1 do
  @spec welcome() :: :ok
  def welcome, do:
    IO.puts("Welcome! Let's fill out your character sheet together.")

  @spec ask_name() :: String.t()
  def ask_name, do:
    IO.gets("What is your character's name?\n")
    |> String.trim

  @spec ask_class() :: String.t()
  def ask_class, do:
    IO.gets("What is your character's class?\n")
    |> String.trim

  @spec ask_level() :: String.t()
  def ask_level, do:
    IO.gets("What is your character's level?\n")
    |> String.trim
    |> String.to_integer

  @spec run() :: String.t()
  def run do
    welcome
    %{name: ask_name, class: ask_class, level: ask_level}
    |> IO.inspect(label: "Your character")
  end
end

#! Keyword list

defmodule WineCellar do
  def explain_colors, do:
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]

  def filter(cellar, color, opts \\ []) do
    year = Keyword.get(opts, :year)
    country = Keyword.get(opts, :country)
    case {year, country} do
      {nil, nil} ->
        cellar |> Keyword.get_values(color)
      {_, nil} ->
        cellar
        |> Keyword.get_values(color)
        |> filter_by_year(year)
      {nil, _} ->
        cellar
        |> Keyword.get_values(color)
        |> filter_by_country(country)
      {_, _} ->
        cellar
        |> Keyword.get_values(color)
        |> filter_by_country(country)
        |> filter_by_year(year)
    end
  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end

defmodule WineCellarCleverest do
  def explain_colors, do:
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]

  def filter(cellar, color, opts \\ []), do:
    cellar
    |> Keyword.get_values(color)
    |> filter_by_year(opts[:year])
    |> filter_by_country(opts[:country])

  defp filter_by_year(wines, nil), do: wines
  defp filter_by_country(wines, nil), do: wines

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end

#! Ask for help
defmodule WineCellar do
  def explain_colors, do:
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]

  def filter(cellar, color, opts \\ []), do:
    cellar
    |> Keyword.get_values(color)
    |> then(&if year = opts[:year], do: filter_by_year(&1, year), else: &1)
    |> then(&if country = opts[:country], do: filter_by_country(&1, country), else: &1)


  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end

defmodule WineCellar do
  def explain_colors, do:
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]

  def filter(cellar, color, opts \\ [])

  def filter(cellar, color, []), do: cellar |> Keyword.get_values(color)
  def filter(cellar, color, filters) do
    cellar = filter(cellar,color)
    Enum.reduce(filters, cellar, fn
      {:year, year}, cellar -> filter_by_year(cellar, year)
      {:country, country}, cellar -> filter_by_country(cellar, country)
    end)
  end


  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
