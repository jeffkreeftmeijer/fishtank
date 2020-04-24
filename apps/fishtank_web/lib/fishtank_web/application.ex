defmodule FishtankWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FishtankWeb.Telemetry,
      # Start the Endpoint (http/https)
      FishtankWeb.Endpoint,
      {FishtankWeb.Broadcaster, [name: FishtankWeb.Broadcaster, endpoint: FishtankWeb.Endpoint]},
      FishtankWeb.Presence
      # Start a worker by calling: FishtankWeb.Worker.start_link(arg)
      # {FishtankWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FishtankWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FishtankWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
