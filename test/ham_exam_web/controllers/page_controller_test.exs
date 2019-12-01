defmodule HamExamWeb.PageControllerTest do
  use HamExamWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "appRoot"
  end
end
