defmodule FishtankWeb.Receiver do
  use Agent

  def start_link() do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def messages() do
    Agent.get(__MODULE__, & &1)
  end

  def broadcast(one, two, three) do
    Agent.update(__MODULE__, fn state ->
      [{one, two, three} | state]
    end)
  end
end

defmodule FishtankWeb.BroadcasterTest do
  use ExUnit.Case
  alias FishtankWeb.{Broadcaster, Receiver}

  test "is started by the main supervisor" do
    assert Broadcaster
           |> Process.whereis()
           |> is_pid()
  end

  test "broadcasts an update every 16 ms" do
    Receiver.start_link()
    Broadcaster.start_link(name: __MODULE__, endpoint: Receiver)

    Enum.each(1..3, fn n ->
      :timer.sleep(20)
      messages = Receiver.messages()
      assert length(messages) == n
      assert [{"fishtank", "update", %{entities: [%{location: _} | _]}} | _] = messages
    end)
  end
end
