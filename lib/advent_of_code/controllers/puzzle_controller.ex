defmodule AdventOfCode.Controller.PuzzleController do
  @moduledoc """
  AdventOfCode: PuzzleController controller.

  """
  use Bonny.ControllerV2

  step(Bonny.Pluggable.SkipObservedGenerations)
  step(:handle_event)

  # apply the resource
  def handle_event(%Bonny.Axn{action: action} = axn, _opts)
      when action in [:add, :modify, :reconcile] do
    day = axn.resource["spec"]["day"]
    input = axn.resource["spec"]["input"]

    result = %{
      "apiVersion" => "advent-of-code.wttj.co/v1alpha1",
      "kind" => "Result",
      "metadata" => %{
        "name" => axn.resource["metadata"]["name"],
        "namespace" => axn.resource["metadata"]["namespace"]
      },
      "spec" => %{
        "day" => day,
        "year" => axn.resource["spec"]["year"],
        "firstPart" =>
          input
          |> module(day).part1(),
        "secondPart" =>
          input
          |> module(day).part2()
      }
    }

    axn
    |> Bonny.Axn.register_descendant(result)
    |> success_event()
  end

  # delete the resource
  def handle_event(%Bonny.Axn{action: :delete} = axn, _opts) do
    IO.inspect(axn.resource)
    axn
  end

  defp module(day) do
    case day do
      1 -> AdventOfCode.Solvers.Day01
    end
  end
end
