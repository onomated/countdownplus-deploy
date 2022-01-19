defmodule Countdownplus.Repo.Migrations.DropObanBeats do
  use Ecto.Migration

  def up do
    # https://hexdocs.pm/oban/v2-6.html#drop-the-beats-table
    drop_if_exists table("oban_beats")
  end

  def down do
    # No going back!
  end
end
