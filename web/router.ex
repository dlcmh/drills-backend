defmodule Drills.Router do
  use Drills.Web, :router

  pipeline :browser do
    # plug :accepts, ["html"]
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Drills do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/qa_bank", QABankController
    resources "/text_sandboxes", TextSandboxController
  end

  # Other scopes may use custom stacks.
  scope "/api", Drills do
    pipe_through :api

    resources "/qa_bank", QABankController, except: [:new, :edit]
  end
end
