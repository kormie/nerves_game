defmodule NervesGame do
  @moduledoc """
  Documentation for NervesGame.
  """

  @doc """
  Hello world.

  ## Examples

      iex> NervesGame.hello
      :world

  """
  require Logger

  def hello do
    Logger.debug "Hello Nerves"
    :world
  end
end
