defmodule HamExamWeb.QuestionsController do
  use HamExamWeb, :controller

  def index(conn, _params) do
    render(conn, %{questions: []})
  end
end
