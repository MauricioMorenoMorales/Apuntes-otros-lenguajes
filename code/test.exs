defmodule Hero do
  def survive(bullets, dragons) do
    dragons * 2 <= bullets
  end
end

IO.inspect Hero.survive(10, 5)
IO.inspect Hero.survive(4, 5)
IO.inspect Hero.survive(100, 40)
