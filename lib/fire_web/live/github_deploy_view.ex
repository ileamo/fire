defmodule FireWeb.GithubDeployView do
  use Phoenix.LiveView

  def render(assigns) do
    FireWeb.PageView.render("github_deploy.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, deploy_step: "Ready!")}
  end

  def handle_event("github_deploy", _value, socket) do
    :ok = start_deploy()
    send(self(), :create_org)
    {:noreply, assign(socket, deploy_step: "Starting deploy...")}
  end

  def handle_info(:create_org, socket) do
    {:ok, org} = create_org()
    send(self(), {:create_repo, org})
    {:noreply, assign(socket, deploy_step: "Creating GitHub org...")}
  end

  def handle_info({:create_repo, org}, socket) do
    {:ok, repo} = create_repo(org)
    send(self(), {:push_contents, repo})
    {:noreply, assign(socket, deploy_step: "Creating GitHub repo...")}
  end

  def handle_info({:push_contents, repo}, socket) do
    :ok = push_contents(repo)
    send(self(), :done)
    {:noreply, assign(socket, deploy_step: "Pushing to repo...")}
  end

  def handle_info(:done, socket) do
    {:noreply, assign(socket, deploy_step: "Done!")}
  end

  defp start_deploy() do
    sleep()
    :ok
  end

  defp create_org() do
    sleep()
    {:ok, nil}
  end

  defp create_repo(_) do
    sleep()
    {:ok, nil}
  end

  defp push_contents(_) do
    sleep()
    :ok
  end

  defp sleep(), do: Process.sleep(3000)
end
