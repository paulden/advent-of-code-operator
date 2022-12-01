defmodule AdventOfCode.Controller.ResultControllerTest do
  @moduledoc false
  use ExUnit.Case, async: false
  use Bonny.Axn.Test

  alias AdventOfCode.Controller.ResultController

  test "add is handled and returns axn" do
    axn = axn(:add)
    result = ResultController.call(axn, [])
    assert is_struct(result, Bonny.Axn)
  end

  test "modify is handled and returns axn" do
    axn = axn(:modify)
    result = ResultController.call(axn, [])
    assert is_struct(result, Bonny.Axn)
  end

  test "reconcile is handled and returns axn" do
    axn = axn(:reconcile)
    result = ResultController.call(axn, [])
    assert is_struct(result, Bonny.Axn)
  end

  test "delete is handled and returns axn" do
    axn = axn(:delete)
    result = ResultController.call(axn, [])
    assert is_struct(result, Bonny.Axn)
  end
end
