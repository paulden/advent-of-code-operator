
import Config

config :bonny,
  operator_name: "advent-of-code",
  group: "advent-of-code.wttj.co",

  # Function to call to get a K8s.Conn object.
  # The function should return a %K8s.Conn{} struct or a {:ok, %K8s.Conn{}} tuple
  get_conn: {AdventOfCode.K8sConn, :get!, [config_env()]},

  # Name must only consist of only lowercase letters and hyphens.
  # Defaults to hyphenated mix app name
  service_account_name: "advent-of-code",

  # Labels to apply to the operator's resources.
  labels: %{
    "k8s-app" => "advent-of-code"
  },

  # Operator deployment resources. These are the defaults.
  resources: %{limits: %{cpu: "200m", memory: "200Mi"}, requests: %{cpu: "200m", memory: "200Mi"}},

  manifest_override_callback: &Mix.Tasks.Bonny.Gen.Manifest.AdventOfCodeCustomizer.override/1
