defmodule Nixstasis.Repo.Migrations.RenameDeviceBootstrapProfile do
  @moduledoc """
  Renames the stored `atomixos-bootstrap` route profile to the OS-neutral `device-bootstrap`.
  """

  use Ecto.Migration

  def up, do: rename_profile("atomixos-bootstrap", "device-bootstrap")

  def down, do: rename_profile("device-bootstrap", "atomixos-bootstrap")

  defp rename_profile(from, to) do
    execute "UPDATE devices SET remote_access_profile = '#{to}' WHERE remote_access_profile = '#{from}'"

    execute "UPDATE devices SET remote_access_default_profile = '#{to}' WHERE remote_access_default_profile = '#{from}'"

    execute "UPDATE remote_access_leases SET profile = '#{to}' WHERE profile = '#{from}'"
  end
end
