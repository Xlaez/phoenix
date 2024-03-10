defmodule DemoWeb.DefaultController do
  use DemoWeb, :controller

  def index(conn, _params) do
    text conn, "DemoApi!"
  end
end