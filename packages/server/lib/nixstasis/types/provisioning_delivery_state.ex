defmodule Nixstasis.Types.ProvisioningDeliveryState do
  @moduledoc """
  Persisted states for a device bootstrap delivery.
  """

  use Ash.Type.Enum,
    values: [:submitting, :submitted, :running, :succeeded, :failed, :indeterminate]
end
