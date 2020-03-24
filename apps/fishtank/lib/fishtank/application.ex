defmodule Fishtank.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Fishtank.PubSub},
      Fishtank.Entity
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Fishtank.Supervisor)
  end
end
