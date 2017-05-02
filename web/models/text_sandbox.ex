defmodule Drills.TextSandbox do
  use Drills.Web, :model

  schema "text_sandboxes" do
    field :raw, :string
    field :parsed, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    IO.inspect params
    struct
    |> cast(params, [:raw])
    |> validate_required([:raw])
    |> put_change(:parsed, String.trim(params["raw"] || ""))
  end
end
