defmodule NervesGame do
  use GenServer
  import LEDShim
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

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    {:ok, led_shim} = LEDShim.start_link(opts)
    LEDShim.clear()
    {:ok, led_shim}
  end

  def run(pixel, brightness) do
    GenServer.call(__MODULE__, {:set_pixel, pixel, brightness})
  end

  def handle_call({:set_pixel, pixel, brightness}, _from, state) do
    {:reply, :ok, do_run(pixel, brightness, state)}
  end

  def do_run(pixel, brightness, state) do
    LEDShim.set_pixel(pixel, {255, 0, 255}, brightness)
    LEDShim.show
    state
  end
end
