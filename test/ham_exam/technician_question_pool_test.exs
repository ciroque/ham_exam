defmodule HamExam.TechnicianQuestionPoolTest do
  use ExUnit.Case

  require Logger

  test "All questions loaded" do
    %{"subElements" => subElements} = HamExam.TechnicianQuestionPool.questions
    assert length(subElements) == 10
  end

  test "Returns a single random question" do
    assert length(HamExam.TechnicianQuestionPool.get_random()) == 1
  end

  test "Returns 7 random questions" do
    requested_count = 7
    assert length(HamExam.TechnicianQuestionPool.get_random(requested_count)) == requested_count
  end

  test "Returns 35 random questions (full exam)" do
    requested_count = 35
    assert length(HamExam.TechnicianQuestionPool.get_random(requested_count)) == requested_count
  end
end
