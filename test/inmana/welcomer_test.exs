defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special return a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special, Banana!"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "return an ok and a welcome message when the user has more than 18 year" do
      params = %{"name" => "Daniel", "age" => "42"}
      expected_result = {:ok, "Welcome, DANIEL!"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "return an error when the user has less than 18 year" do
      params = %{"name" => "Daniel", "age" => "12"}
      expected_result = {:error, "You shall not pass, DANIEL"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
