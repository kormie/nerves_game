defmodule NervesGameTest do
  use ExUnit.Case
  doctest NervesGame

  test "greets the world" do
    assert NervesGame.hello() == :world
  end
end
