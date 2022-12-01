defmodule AdventOfCode.Operator do
  @moduledoc """
  Defines the operator.

  The operator resource defines custom resources, watch queries and their
  controllers and serves as the entry point to the watching and handling
  processes.
  """
  use Bonny.Operator, default_watch_namespace: "default"

  step(Bonny.Pluggable.Logger, level: :info)
  step(:delegate_to_controller)
  step(Bonny.Pluggable.ApplyStatus)
  step(Bonny.Pluggable.ApplyDescendants)

  @impl Bonny.Operator
  def controllers(watching_namespace, _opts) do
    [
      %{
        query:
          K8s.Client.list("advent-of-code.wttj.co/v1alpha1", "Puzzle",
            namespace: watching_namespace
          ),
        controller: AdventOfCode.Controller.PuzzleController
      }
    ]
  end

  @impl Bonny.Operator
  def crds() do
    [
      %Bonny.API.CRD{
        group: "advent-of-code.wttj.co",
        names: %{
          kind: "Result",
          plural: "results",
          shortNames: [],
          singular: "result"
        },
        scope: :Namespaced,
        versions: [AdventOfCode.API.V1Alpha1.Result]
      },
      %Bonny.API.CRD{
        group: "advent-of-code.wttj.co",
        names: %{
          kind: "Puzzle",
          plural: "puzzles",
          shortNames: [],
          singular: "puzzle"
        },
        scope: :Namespaced,
        versions: [AdventOfCode.API.V1Alpha1.Puzzle]
      }
    ]
  end
end
