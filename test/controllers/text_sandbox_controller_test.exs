defmodule Drills.TextSandboxControllerTest do
  use Drills.ConnCase

  alias Drills.TextSandbox
  @valid_attrs %{parsed: "some content", raw: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, text_sandbox_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing text sandboxes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, text_sandbox_path(conn, :new)
    assert html_response(conn, 200) =~ "New text sandbox"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, text_sandbox_path(conn, :create), text_sandbox: @valid_attrs
    assert redirected_to(conn) == text_sandbox_path(conn, :index)
    assert Repo.get_by(TextSandbox, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, text_sandbox_path(conn, :create), text_sandbox: @invalid_attrs
    assert html_response(conn, 200) =~ "New text sandbox"
  end

  test "shows chosen resource", %{conn: conn} do
    text_sandbox = Repo.insert! %TextSandbox{}
    conn = get conn, text_sandbox_path(conn, :show, text_sandbox)
    assert html_response(conn, 200) =~ "Show text sandbox"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, text_sandbox_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    text_sandbox = Repo.insert! %TextSandbox{}
    conn = get conn, text_sandbox_path(conn, :edit, text_sandbox)
    assert html_response(conn, 200) =~ "Edit text sandbox"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    text_sandbox = Repo.insert! %TextSandbox{}
    conn = put conn, text_sandbox_path(conn, :update, text_sandbox), text_sandbox: @valid_attrs
    assert redirected_to(conn) == text_sandbox_path(conn, :show, text_sandbox)
    assert Repo.get_by(TextSandbox, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    text_sandbox = Repo.insert! %TextSandbox{}
    conn = put conn, text_sandbox_path(conn, :update, text_sandbox), text_sandbox: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit text sandbox"
  end

  test "deletes chosen resource", %{conn: conn} do
    text_sandbox = Repo.insert! %TextSandbox{}
    conn = delete conn, text_sandbox_path(conn, :delete, text_sandbox)
    assert redirected_to(conn) == text_sandbox_path(conn, :index)
    refute Repo.get(TextSandbox, text_sandbox.id)
  end
end
