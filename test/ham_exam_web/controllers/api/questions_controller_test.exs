defmodule HamExamWeb.QuestionsControllerTest do
  use HamExamWeb.ConnCase

  test "GET / returns all questions", %{conn: conn} do
    conn = get(conn, "/api/questions")
    assert json_response(conn, 200)["data"] == []
  end
end
