defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "create the restaurant when all params are valid", %{conn: conn} do
      params = %{"name" => "teste", "email" => "teste@asd.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created",
               "restaurant" => %{"email" => "teste@asd.com", "name" => "teste"}
             } = response
    end

    test "return error when there are invalid params", %{conn: conn} do
      params = %{"name" => "teste", "email" => "invalid_email"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{"message" => %{"email" => ["has invalid format"]}} = response
    end
  end
end
