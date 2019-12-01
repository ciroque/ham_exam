defmodule HamExamWeb.QuestionsControllerTest do
  use HamExamWeb.ConnCase

  test "GET / returns a single question (the default)", %{conn: conn} do
    conn = get(conn, "/api/questions")
    assert length(json_response(conn, 200)["data"]) == 1
  end

  test "GET / returns a specified number of questions", %{conn: conn} do
    expected_count = 35
    conn = get(conn, "/api/questions?count=#{expected_count}")
    assert length(json_response(conn, 200)["data"]) == expected_count
  end
end
