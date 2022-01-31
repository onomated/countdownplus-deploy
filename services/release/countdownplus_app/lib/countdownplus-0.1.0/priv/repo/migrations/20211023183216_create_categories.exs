defmodule Countdownplus.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  alias Countdownplus.Db.Migration, as: Utils

  def change do
    #
    # Categories
    #
    create table("categories") do
      add :owner_id, references("users", on_delete: :delete_all), null: false

      timestamps()

      Utils.embeds(:settings, null: false)
      Utils.counter_cache_column("countdown")
    end

    create index("categories", [:owner_id])

    #
    # Countdowns categories join table
    #
    create table("countdowns_categories", primary_key: false) do
      add :countdown_id, references("countdowns", on_delete: :delete_all),
        null: false,
        primary_key: true

      add :category_id, references("categories", on_delete: :delete_all),
        null: false,
        primary_key: true
    end

    #
    # Counter cache triggers
    #
    Utils.counter_cache_on_table(
      "categories",
      :countdown_count,
      "countdowns_categories",
      :category_id
    )
  end
end
