defmodule KVServerTest do
  use ExUnit.Case
  doctest KVServer

  @tag skip: "placehlder from generated project"
  test "greets the world" do
    assert KVServer.hello() == :world
  end
end
