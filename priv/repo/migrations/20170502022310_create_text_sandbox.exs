defmodule Drills.Repo.Migrations.CreateTextSandbox do
  use Ecto.Migration

  def change do
    create table(:text_sandboxes) do
      add :raw, :text
      add :parsed, :text

      timestamps()
    end

  end
end
