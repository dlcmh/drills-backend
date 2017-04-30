defmodule Drills.QABankControllerTest do
  use Drills.ConnCase

  alias Drills.QABank
  @valid_attrs %{answer: "some content", question: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, qa_bank_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing qa bank"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, qa_bank_path(conn, :new)
    assert html_response(conn, 200) =~ "New qa bank"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, qa_bank_path(conn, :create), qa_bank: @valid_attrs
    assert redirected_to(conn) == qa_bank_path(conn, :index)
    assert Repo.get_by(QABank, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, qa_bank_path(conn, :create), qa_bank: @invalid_attrs
    assert html_response(conn, 200) =~ "New qa bank"
  end

  test "shows chosen resource", %{conn: conn} do
    qa_bank = Repo.insert! %QABank{}
    conn = get conn, qa_bank_path(conn, :show, qa_bank)
    assert html_response(conn, 200) =~ "Show qa bank"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, qa_bank_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    qa_bank = Repo.insert! %QABank{}
    conn = get conn, qa_bank_path(conn, :edit, qa_bank)
    assert html_response(conn, 200) =~ "Edit qa bank"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    qa_bank = Repo.insert! %QABank{}
    conn = put conn, qa_bank_path(conn, :update, qa_bank), qa_bank: @valid_attrs
    assert redirected_to(conn) == qa_bank_path(conn, :show, qa_bank)
    assert Repo.get_by(QABank, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    qa_bank = Repo.insert! %QABank{}
    conn = put conn, qa_bank_path(conn, :update, qa_bank), qa_bank: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit qa bank"
  end

  test "deletes chosen resource", %{conn: conn} do
    qa_bank = Repo.insert! %QABank{}
    conn = delete conn, qa_bank_path(conn, :delete, qa_bank)
    assert redirected_to(conn) == qa_bank_path(conn, :index)
    refute Repo.get(QABank, qa_bank.id)
  end
end
