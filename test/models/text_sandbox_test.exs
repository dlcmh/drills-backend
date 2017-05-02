defmodule Drills.TextSandboxTest do
  use Drills.ModelCase

  alias Drills.TextSandbox

  @valid_attrs %{parsed: "some content", raw: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TextSandbox.changeset(%TextSandbox{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TextSandbox.changeset(%TextSandbox{}, @invalid_attrs)
    refute changeset.valid?
  end
end
