defmodule Drills.TextSandboxController do
  use Drills.Web, :controller

  alias Drills.TextSandbox

  def index(conn, _params) do
    text_sandboxes = Repo.all(TextSandbox)
    render(conn, "index.html", text_sandboxes: text_sandboxes)
  end

  def new(conn, _params) do
    changeset = TextSandbox.changeset(%TextSandbox{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"text_sandbox" => text_sandbox_params}) do
    changeset = TextSandbox.changeset(%TextSandbox{}, text_sandbox_params)

    case Repo.insert(changeset) do
      {:ok, _text_sandbox} ->
        conn
        |> put_flash(:info, "Text sandbox created successfully.")
        |> redirect(to: text_sandbox_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    text_sandbox = Repo.get!(TextSandbox, id)
    render(conn, "show.html", text_sandbox: text_sandbox)
  end

  def edit(conn, %{"id" => id}) do
    text_sandbox = Repo.get!(TextSandbox, id)
    changeset = TextSandbox.changeset(text_sandbox)
    render(conn, "edit.html", text_sandbox: text_sandbox, changeset: changeset)
  end

  def update(conn, %{"id" => id, "text_sandbox" => text_sandbox_params}) do
    text_sandbox = Repo.get!(TextSandbox, id)
    changeset = TextSandbox.changeset(text_sandbox, text_sandbox_params)

    case Repo.update(changeset) do
      {:ok, text_sandbox} ->
        conn
        |> put_flash(:info, "Text sandbox updated successfully.")
        |> redirect(to: text_sandbox_path(conn, :show, text_sandbox))
      {:error, changeset} ->
        render(conn, "edit.html", text_sandbox: text_sandbox, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    text_sandbox = Repo.get!(TextSandbox, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(text_sandbox)

    conn
    |> put_flash(:info, "Text sandbox deleted successfully.")
    |> redirect(to: text_sandbox_path(conn, :index))
  end
end
