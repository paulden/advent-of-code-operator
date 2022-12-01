defmodule AdventOfCode.API.V1Alpha1.Result do
  @moduledoc """
  AdventOfCode: Result CRD V1Alpha1 version.

  Modify the `manifest/0` function in order to override the defaults,
  e.g. to define an openAPIV3 schema, add subresources or additional
  printer columns:
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
                firstPart: %{type: :integer},
                secondPart: %{type: :integer},
                year: %{type: :integer},
                day: %{type: :integer}
              }
            },
            status: %{
              type: :object,
              properties: %{
                # TODO: Use date
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
          name: "firstPart",
          type: :integer,
          description: "First part result",
          jsonPath: ".spec.firstPart"
        },
        %{
          name: "secondPart",
          type: :integer,
          description: "Second part result",
          jsonPath: ".spec.secondPart"
        }
      ],
      subresources: %{
        status: %{}
      }
    )
  end
end
