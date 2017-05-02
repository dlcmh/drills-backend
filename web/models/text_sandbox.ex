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
    struct
    |> cast(params, [:raw])
    |> validate_required([:raw])
    |> put_change(:parsed, process_text(params["raw"]))
  end

  defp process_text(text) do
    if text == nil do
      ""
    else
      text
      |> String.split("\n")
      |> Enum.map(fn line -> String.strip(line) end)
      |> Enum.map(fn line -> clean_each_cell_in_line(line) end)
      |> Enum.join("\n")
    end
  end

  defp clean_each_cell_in_line(line) do
    line
    |> String.split("\t")
    |> Enum.map(fn string -> String.strip(string) end)
    |> Enum.join("\t")
  end
end
