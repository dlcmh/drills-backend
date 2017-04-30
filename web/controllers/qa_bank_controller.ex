defmodule Drills.QABankController do
  use Drills.Web, :controller

  alias Drills.QABank

  def index(conn, _params) do
    qa_bank = Repo.all(QABank)
    render(conn, "index.html", qa_bank: qa_bank)
  end

  def new(conn, _params) do
    changeset = QABank.changeset(%QABank{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"qa_bank" => qa_bank_params}) do
    changeset = QABank.changeset(%QABank{}, qa_bank_params)

    case Repo.insert(changeset) do
      {:ok, _qa_bank} ->
        conn
        |> put_flash(:info, "Qa bank created successfully.")
        |> redirect(to: qa_bank_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    qa_bank = Repo.get!(QABank, id)
    render(conn, "show.html", qa_bank: qa_bank)
  end

  def edit(conn, %{"id" => id}) do
    qa_bank = Repo.get!(QABank, id)
    changeset = QABank.changeset(qa_bank)
    render(conn, "edit.html", qa_bank: qa_bank, changeset: changeset)
  end

  def update(conn, %{"id" => id, "qa_bank" => qa_bank_params}) do
    qa_bank = Repo.get!(QABank, id)
    changeset = QABank.changeset(qa_bank, qa_bank_params)

    case Repo.update(changeset) do
      {:ok, qa_bank} ->
        conn
        |> put_flash(:info, "QA updated successfully.")
        |> redirect(to: qa_bank_path(conn, :show, qa_bank))
      {:error, changeset} ->
        render(conn, "edit.html", qa_bank: qa_bank, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    qa_bank = Repo.get!(QABank, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(qa_bank)

    conn
    |> put_flash(:info, "QA deleted successfully.")
    |> redirect(to: qa_bank_path(conn, :index))
  end
end
