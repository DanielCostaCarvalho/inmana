defmodule InmanaWeb.SuppliesController do
  use InmanaWeb, :controller

  alias Inmana.Supply

  action_fallback InmanaWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Inmana.create_supply(params) do
      conn
      |> put_status(:created)
      |> json(%{
        message: "Supply created!",
        supply: supply
      })
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Supply{} = supply} <- Inmana.get_supply(id) do
      conn
      |> put_status(:ok)
      |> json(supply)
    end
  end
end
