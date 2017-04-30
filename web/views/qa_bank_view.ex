defmodule Drills.QABankView do
  use Drills.Web, :view

  def render("index.json", %{qa_bank: qa_bank}) do
    %{data: render_many(qa_bank, Drills.QABankView, "qa_bank.json")}
  end

  def render("qa_bank.json", %{qa_bank: qa_bank}) do
    %{
      id: qa_bank.id,
      question: qa_bank.question,
      answer: qa_bank.answer
    }
  end
end
