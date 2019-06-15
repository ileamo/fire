defmodule FireWeb.PageController do
  use FireWeb, :controller

  def index(conn, _) do
    Phoenix.LiveView.Controller.live_render(conn, FireWeb.GithubDeployView, session: %{})
  end
end
