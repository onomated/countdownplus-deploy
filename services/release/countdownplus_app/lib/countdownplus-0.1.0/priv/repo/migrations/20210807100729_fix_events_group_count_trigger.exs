defmodule Countdownplus.Repo.Migrations.FixEventsGroupCountTrigger do
  use Ecto.Migration

  alias Countdownplus.Db.Migration, as: Utils

  def change do
    # Mistakenly configured event groups_count counter cache to reference groups table as opposed to group_events table
    execute("DROP TRIGGER IF EXISTS update_events_group_count_trigger ON public.groups", "")
    Utils.counter_cache_on_table(:events, :group_count, :group_events, :event_id)
  end
end
