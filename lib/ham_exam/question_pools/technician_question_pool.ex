defmodule HamExam.TechnicianQuestionPool do
  @questions Jason.decode!(File.read! "priv/data/technician-questions.json")

  def questions, do: @questions

  def get_random(count \\ 1) do
    for _ <- 1..count, do: get_random_question()
  end

  defp get_random_question() do
    %{"subElements" => subElements} = HamExam.TechnicianQuestionPool.questions
    subElementCount = length(subElements) - 1
    subElementIndex = :rand.uniform(subElementCount)

    %{"title" => subelementTitle, "groups" => groups} = subElements |> Enum.at(subElementIndex)
    groupCount = length(groups) - 1
    groupIndex = :rand.uniform(groupCount)

    %{"title" => groupTitle, "questions" => questions} = groups |> Enum.at(groupIndex)
    questionCount = length(questions) - 1
    questionIndex = :rand.uniform(questionCount)

    %{
      "subelementTitle" => subelementTitle,
      "groupTitle" => groupTitle,
      "question" => questions |> Enum.at(questionIndex)
    }
  end
end
