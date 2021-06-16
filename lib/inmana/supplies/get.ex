defmodule Inmana.Supplies.Get do
  alias Inmana.{Supply, Repo}

  def call(id) do
    Supply |> Repo.get(id) |> handle_response()
  end

  defp handle_response(%Supply{} = supply) do
    {:ok, supply}
  end

  defp handle_response(nil) do
    {:error, %{result: "Supply nopt found", status: :not_found}}
  end
end
