defmodule InmanaWeb.RestaurantsView do
  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created",
      restaurant: restaurant
    }
  end
end
