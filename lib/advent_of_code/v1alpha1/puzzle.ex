defmodule AdventOfCode.API.V1Alpha1.Puzzle do
  @moduledoc """
  AdventOfCode: Puzzle CRD V1Alpha1 version.
  """
  use Bonny.API.Version,
    hub: true

  @impl true
  def manifest() do
    struct!(
      defaults(),
      name: "v1alpha1",
      schema: %{
        openAPIV3Schema: %{
          type: :object,
          properties: %{
            spec: %{
              type: :object,
              properties: %{
                input: %{type: :string},
                year: %{type: :integer},
                day: %{type: :integer}
              }
            },
            status: %{
              type: :object,
              properties: %{
                solved: %{type: :boolean},
                observedGeneration: %{type: :integer}
              }
            }
          }
        }
      },
      additionalPrinterColumns: [
        %{name: "day", type: :integer, description: "Day of the puzzle", jsonPath: ".spec.day"},
        %{
          name: "year",
          type: :integer,
          description: "Year of the puzzle",
          jsonPath: ".spec.year"
        },
        %{
          name: "solved",
          type: :boolean,
          description: "Resolution status",
          jsonPath: ".status.solved"
        }
      ],
      subresources: %{
        status: %{}
      }
    )
  end
end
