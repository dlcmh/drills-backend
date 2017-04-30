defmodule Drills.Repo.Migrations.CreateQABank do
  use Ecto.Migration

  def change do
    create table(:qa_bank) do
      add :question, :string
      add :answer, :string

      timestamps()
    end

  end
end
