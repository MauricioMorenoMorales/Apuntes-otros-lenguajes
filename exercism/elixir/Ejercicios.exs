# ejercicio lasagna de guido

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
