defmodule HamExamWeb.Router do
  use HamExamWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  scope "/api", HamExamWeb do
    pipe_through :api

    get "/questions", QuestionsController, :index
  end

  scope "/", HamExamWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end

end
