defmodule Countdownplus.Repo.Migrations.AddUsersPrivacyMode do
  use Ecto.Migration

  alias Countdownplus.Types.Enums.PrivacyMode

  def change do
    PrivacyMode.create_type()

    alter table("users") do
      add :privacy_mode, PrivacyMode.type(), null: false, default: "public"
    end

    create index("users", [:privacy_mode])
  end
end
