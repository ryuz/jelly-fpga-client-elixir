defmodule JellyFpgaClientTest do
  use ExUnit.Case
  doctest JellyFpgaClient

  test "greets the world" do
    assert JellyFpgaClient.hello() == :world
  end
end
