defmodule HamExamWeb.PageController do
  use HamExamWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
