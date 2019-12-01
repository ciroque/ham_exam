defmodule HamExamWeb.QuestionsController do
  use HamExamWeb, :controller

  def index(conn, %{"count" => count}) do
    questions = HamExam.TechnicianQuestionPool.get_random(check_count(count))
    render(conn, %{questions: questions})
  end

  def index(conn, _paramss) do
    questions = HamExam.TechnicianQuestionPool.get_random()
    render(conn, %{questions: questions})
  end

  defp check_count(count) do
    case Integer.parse(count) do
      :error -> 1
      {c, _} -> c
    end
  end
end
