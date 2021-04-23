defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, creates the restaurant", %{conn: conn} do
      params = %{name: "Restaurante Teste", email: "restauranteteste@gmail.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "Restaurant created!",
        "restaurant" => %{
          "email" => "restauranteteste@gmail.com",
          "id" => _id,
          "name" => "Restaurante Teste"
        }
      } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{email: "restauranteteste@gmail.com"}
      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{
        "message" => "Restaurant created!",
        "restaurant" => %{
          "email" => "restauranteteste@gmail.com",
          "id" => _id,
          "name" => "Restaurante Teste"
        }
      } = response
    end
  end
end
