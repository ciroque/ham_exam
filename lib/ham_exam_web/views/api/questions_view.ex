defmodule HamExamWeb.QuestionsView do
  use HamExamWeb, :view

  def render("index.json", %{questions: questions}) do
    %{data: render_many(questions, __MODULE__, "question.json")}
  end

  def render("post.json", %{blog: post}) do
    post
  end
end
