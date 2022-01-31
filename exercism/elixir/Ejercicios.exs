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
