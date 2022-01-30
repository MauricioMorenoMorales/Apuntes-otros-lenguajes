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
