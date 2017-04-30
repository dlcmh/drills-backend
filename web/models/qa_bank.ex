defmodule Drills.QABank do
  use Drills.Web, :model

  schema "qa_bank" do
    field :question, :string
    field :answer, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:question, :answer])
    # |> validate_required([:question, :answer])
  end
end
