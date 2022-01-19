defmodule Countdownplus.Repo.Migrations.CreateFunctions do
  use Ecto.Migration

  alias Countdownplus.Db.Migration, as: Utils

  def change do
    execute Utils.increment_counter_sql_up(), Utils.increment_counter_sql_down()
    execute Utils.counter_cache_sql_up(), Utils.counter_cache_sql_down()
  end
end
