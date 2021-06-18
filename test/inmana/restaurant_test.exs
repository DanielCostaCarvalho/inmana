defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "return a valid changeset when params are valid" do
      params = %{"name" => "teste", "email" => "teste@asd.com"}

      result = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{name: "teste", email: "teste@asd.com"},
               valid?: true
             } = result
    end

    test "return an invalid changeset when params are invalid" do
      params = %{"name" => "teste", "email" => "invalid_email"}

      result = Restaurant.changeset(params)

      assert %Changeset{
               valid?: false
             } = result

      assert errors_on(result) == %{email: ["has invalid format"]}
    end
  end
end
