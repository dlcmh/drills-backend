defmodule Drills.QABankTest do
  use Drills.ModelCase

  alias Drills.QABank

  @valid_attrs %{answer: "some content", question: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = QABank.changeset(%QABank{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = QABank.changeset(%QABank{}, @invalid_attrs)
    refute changeset.valid?
  end
end
