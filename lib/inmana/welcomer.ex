defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    name |> String.trim() |> String.upcase() |> evaluate(age |> String.to_integer())
  end

  defp evaluate("BANANA", 42) do
    {:ok, "You are very special, Banana!"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome, #{name}!"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass, #{name}"}
  end
end
