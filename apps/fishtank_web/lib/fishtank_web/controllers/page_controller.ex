defmodule FishtankWeb.PageController do
  use FishtankWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
