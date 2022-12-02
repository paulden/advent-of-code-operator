defmodule AdventOfCode.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    children = [{AdventOfCode.Operator, conn: AdventOfCode.K8sConn.get!(:dev)}]

    opts = [strategy: :one_for_one, name: AdventOfCode.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
