defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcomer/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special, Banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a special message" do
      params = %{"name" => "Cleber", "age" => "30"}
      expected_result = {:ok, "Welcome, cleber"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is underage, returns an error" do
      params = %{"name" => "Emilio", "age" => "16"}
      expected_result = {:error, "You shall not pass, emilio"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end