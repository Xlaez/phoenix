defmodule DemoWeb.BusinessController do
  use DemoWeb, :controller

  alias Demo.Directory
  alias Demo.Directory.Business

  action_fallback DemoWeb.FallbackController

  def index(conn, _params) do
    businesses = Directory.list_businesses()
    render(conn, :index, businesses: businesses)
  end

  def create(conn, %{"business" => business_params}) do
    with {:ok, %Business{} = business} <- Directory.create_business(business_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/businesses/#{business}")
      |> render(:show, business: business)
    end
  end

  def show(conn, %{"id" => id}) do
    business = Directory.get_business!(id)
    render(conn, :show, business: business)
  end

  def update(conn, %{"id" => id, "business" => business_params}) do
    business = Directory.get_business!(id)

    with {:ok, %Business{} = business} <- Directory.update_business(business, business_params) do
      render(conn, :show, business: business)
    end
  end

  def delete(conn, %{"id" => id}) do
    business = Directory.get_business!(id)

    with {:ok, %Business{}} <- Directory.delete_business(business) do
      send_resp(conn, :no_content, "")
    end
  end

  def list_businesses() do
    Repo.all(Business)
  end
end
