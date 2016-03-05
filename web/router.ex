defmodule Friendship.Router do
  use Friendship.Web, :router
  use ExAdmin.Router
  use Passport

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  admin_routes  :admin
  scope "/", Friendship do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
    get "/forget-password", PasswordController, :forget_password
    post "/reset-password", PasswordController, :reset_password
  end

  # Other scopes may use custom stacks.
  # scope "/api", Friendship do
  #   pipe_through :api
  # end
end
