defmodule Countdownplus.Repo.Migrations.CreateApp do
  use Ecto.Migration

  import String, only: [to_atom: 1]
  import Inflex

  alias Countdownplus.Db.Migration, as: Utils
  alias Countdownplus.Db.IndexNames

  alias Countdownplus.Types.Enums.{
    AccountType,
    ActivityEntity,
    ActivityType,
    AppEdition,
    ArticleType,
    AuthMethod,
    AuthProvider,
    AttachmentType,
    AttachmentProvider,
    AuthMethod,
    DevicePlatform,
    EventAccessMode,
    EventProvider,
    EventType,
    Pronoun,
    GroupAccessMode,
    GroupMembershipStatus,
    GroupMembershipType,
    # InvitationResponse,
    # NotificationChannel,
    PurchaseModel,
    RelationshipType,
    # ReminderUnit,
    ProfileAttachmentType
  }

  alias Countdownplus.Types.Ecto.DateTimeMask

  def change do
    #
    # Users
    #
    create table(:users) do
      timestamps()
      Utils.soft_delete_column()
      Utils.last_seen_column()

      add :account_type, AccountType.type(), null: false

      add :username, :citext, null: false
      add :email, :citext

      add :first_name, :text
      add :last_name, :text

      add :pronoun, Pronoun.type()
      add :dob, :utc_datetime_usec

      add :dob_visibility_mask, :int,
        null: false,
        default: DateTimeMask.dob_visibility_birthday_value()

      add :timezone, :text
      add :language_code, :text
      add :locale, :text
      add :country_code, :text

      Utils.embeds(:settings)
      # For data like name, phone numbers, emails etc
      Utils.embed_extended()
      # For data like staff permissions, legacy/mongo_id
      Utils.embed_internal()

      Utils.counter_cache_column("countdown")
      Utils.counter_cache_column("event")
      Utils.counter_cache_column("follower")
      Utils.counter_cache_column("following")
      Utils.counter_cache_column("group")
      Utils.counter_cache_column("group_membership")
      Utils.counter_cache_column("user_attachment")
    end

    # Add generated column to compute users score on count updates
    execute Utils.update_user_score_up(), Utils.update_user_score_down()
    execute Utils.add_generated_users_score_column(), Utils.drop_generated_users_score_column()

    create constraint(
             :users,
             :country_code_is_uppercase,
             check: "UPPER(country_code) = country_code"
           )

    create unique_index(
             :users,
             [:email],
             where: "email IS NOT NULL",
             name: IndexNames.users_unique_email_index_name()
           )

    create unique_index(:users, [:username], name: IndexNames.users_unique_username_index_name())
    create index(:users, [:account_type])
    create index(:users, [:last_seen_at])
    create index(:users, [:score])
    create index(:users, [:updated_at])
    Utils.create_trigram_index(:users, [:username, :email, :first_name, :last_name])

    #
    # Contacts
    #  Use relationships instead
    #
    # create table(:contacts) do
    #   add :owner_id, references(:users, on_delete: :nothing), null: false
    #   add :user_id, references(:users, on_delete: :nothing)

    #   add :name, :text, null: false

    #   # All other fields like pronoun, dob, emails, phone numbers, image links etc
    #   # that can help with invites
    #   Utils.embed_extended()

    #   # For internal ids from contact imports from iOS and Android for example
    #   Utils.embed_internal()

    #   timestamps()
    # end

    # create index(:contacts, [:owner_id])
    # create index(:contacts, [:user_id], where: "user_id IS NOT NULL")

    #
    # Credentials
    #
    create table(:credentials) do
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
      add :confirmed_at, :utc_datetime_usec

      add :auth_method, AuthMethod.type(), null: false
      add :auth_provider, AuthProvider.type(), null: false
      add :login, :citext, null: false
      # oauth may not have associated secrets/tokens
      add :secret, :text

      add :sign_in_count, :integer, null: false, default: 0
      add :sign_in_at, :utc_datetime_usec
      add :sign_in_ip, :inet

      # Provider tokens and expiration dates
      Utils.embed_internal()
    end

    create unique_index(
             :credentials,
             [:auth_provider, :login],
             name: IndexNames.credentials_unique_login_index_name()
           )

    create index(:credentials, [:user_id])

    #
    # Credential Tokens
    #
    create table(:credential_tokens) do
      add :credential_id, references(:credentials, on_delete: :delete_all), null: false

      timestamps(updated_at: false)

      add :context, :text, null: false
      add :token, :text, null: false
      add :sent_to, :text
    end

    create unique_index(
             :credential_tokens,
             [:context, :token],
             name: IndexNames.credential_tokens_unique_token_index_name()
           )

    create index(:credential_tokens, [:credential_id])

    #
    # Auth Provider Profiles
    #
    create table(:auth_provider_profiles, primary_key: false) do
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()

      add :provider_id, :text, null: false, primary_key: true
      add :auth_provider, AuthProvider.type(), null: false, primary_key: true

      add :first_name, :text
      add :last_name, :text

      # All other fields like name, username, pronoun, dob, image links etc
      Utils.embed_extended()
      # Fields such as raw responses
      Utils.embed_internal()
    end

    create index(:auth_provider_profiles, [:user_id])

    #
    # Devices
    #
    create table(:devices) do
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
      Utils.soft_delete_column()
      Utils.last_seen_column()

      add :platform, DevicePlatform.type(), null: false
      add :fcm_token, :text
      add :apns_token, :text

      add :app_edition, AppEdition.type()
      add :app_version, :integer
      add :model, :text
      add :os_version, :text

      add :timezone, :text
      add :language_code, :text
      add :locale, :text
      add :country_code, :text

      add :last_ip, :inet

      # Include screen size, density, upgrade_skus, disk(?), ram(?), permissions
      Utils.embed_details()
    end

    create constraint(
             :devices,
             :country_code_is_uppercase,
             check: "UPPER(country_code) = country_code"
           )

    create unique_index(
             :devices,
             [:fcm_token],
             name: IndexNames.devices_unique_fcm_token_name(),
             where: "fcm_token IS NOT NULL"
           )

    create unique_index(
             :devices,
             [:apns_token],
             name: IndexNames.devices_unique_apns_token_name(),
             where: "apns_token IS NOT NULL"
           )

    create index(:devices, [:platform])
    create index(:devices, [:user_id])

    #
    # Events
    #
    create table(:events) do
      add :owner_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
      Utils.soft_delete_column()

      add :access_mode, EventAccessMode.type(), null: false
      add :event_type, EventType.type(), null: false

      add :title, :text, null: false
      add :slug, :text, null: false
      add :short_code, :text, null: false
      add :highlights, :text
      add :description, :text

      add :date_range, :tstzrange, null: false
      add :starts_at, :utc_datetime_usec, null: false
      add :duration, :bigint, null: false
      add :timezone, :text
      add :date_mask, :int

      add :country_code, :text
      add :canonical_key, :text
      add :tags, {:array, :text}

      add :provider, EventProvider.type()
      add :provider_id, :text

      # iCal Recurrence
      Utils.embeds(:recurrence)
      # Countdown settings
      # :count_units, array: CountUnit.type(), null: false
      # Utils.embeds(:reminder)
      # Utils.embeds(:appearance)
      # Utils.embeds(:sound)
      Utils.embeds(:countdown_settings)
      # Translations
      Utils.embeds(:translations)
      # Holds event type specific settings
      Utils.embed_extended()
      # Internal IDs for holiday imports for example
      Utils.embed_internal()

      Utils.counter_cache_column("countdown")
      Utils.counter_cache_column("group")
      Utils.counter_cache_column("event_attachment")
    end

    # Add generated column to compute events score on count updates
    execute Utils.update_event_score_up(), Utils.update_event_score_down()
    execute Utils.add_generated_events_score_column(), Utils.drop_generated_events_score_column()

    create constraint(
             :events,
             :country_code_is_uppercase,
             check: "UPPER(country_code) = country_code"
           )

    create constraint(
             :events,
             :provider_and_id_specified,
             check:
               "(provider IS NULL AND provider_id IS NULL) OR (provider IS NOT NULL AND provider_id IS NOT NULL)"
           )

    create unique_index(:events, [:short_code], name: IndexNames.events_unique_short_code())
    create unique_index(:events, [:slug], name: IndexNames.events_unique_slug())

    create unique_index(
             :events,
             [:provider, :provider_id],
             name: IndexNames.events_unique_provider_data(),
             where: "provider IS NOT NULL AND provider_id IS NOT NULL"
           )

    create index(:events, [:owner_id])
    create index(:events, [:access_mode])
    create index(:events, [:event_type])
    create index(:events, [:date_range], using: "GIST")
    create index(:events, [:starts_at])
    create index(:events, [:canonical_key], where: "canonical_key IS NOT NULL")
    create index(:events, [:score])
    create index(:events, [:updated_at])
    Utils.create_trigram_index(:events, [:title, :highlights])

    #
    # Countdowns
    #
    create table(:countdowns) do
      add :owner_id, references(:users, on_delete: :delete_all), null: false
      add :event_id, references(:events, on_delete: :delete_all), null: false

      timestamps()
      Utils.soft_delete_column()

      # Countdown settings
      # :count_units, array: CountUnit.type(), null: false
      # Utils.embeds(:reminder)
      # Utils.embeds(:appearance)
      # Utils.embeds(:sound)
      Utils.embeds(:countdown_settings)
      # Overrides of event type specific settings:
      # For example, title can be overriden to provide a private title from a public title
      # e.g. Public title: "James' Birthday", internal title: "My Birthday"
      Utils.embed_extended()
      # For mongo id
      Utils.embed_internal()
    end

    create unique_index(:countdowns, [:owner_id, :event_id],
             name: IndexNames.countdowns_unique_event_watcher_name()
           )

    create index(:countdowns, [:event_id])
    create index(:countdowns, [:updated_at])

    #
    # User life events
    #
    create table(:user_life_events, primary_key: false) do
      timestamps(updated_at: false)

      add :event_id, references(:events, on_delete: :delete_all), null: false, primary_key: true
      add :user_id, references(:users, on_delete: :delete_all), null: false, primary_key: true

      # Include life event type and title/role
      Utils.embed_extended()
    end

    #
    # Event Participants
    #
    # create table(:event_participants, primary_key: false) do
    #   add :event_id, references(:events, on_delete: :delete_all), null: false, primary_key: true
    #   add :user_id, references(:users, on_delete: :delete_all), null: false, primary_key: true

    #   # Include participant title such as wedding planner, guest etc
    #   Utils.embed_extended()

    #   timestamps()
    # end

    #
    # Follows
    #
    create table(:follows, primary_key: false) do
      timestamps(updated_at: false)

      add :follower_id, references(:users, on_delete: :delete_all), null: false, primary_key: true
      add :followed_id, references(:users, on_delete: :delete_all), null: false, primary_key: true
    end

    create constraint(:follows, :not_self, check: "follower_id <> followed_id")

    #
    # Relationships
    #
    create table(:relationships, primary_key: false) do
      timestamps(updated_at: false)

      add :relater_id, references(:users, on_delete: :delete_all), null: false, primary_key: true
      add :related_id, references(:users, on_delete: :delete_all), null: false, primary_key: true

      add :relationship_type, RelationshipType.type(), null: false
      # Other relationship type specifics, such as inferred inverses
      Utils.embed_details()
    end

    create constraint(:relationships, :not_self, check: "relater_id <> related_id")

    #
    # Groups
    #
    create table(:groups) do
      add :owner_id, references(:users, on_delete: :delete_all), null: false

      timestamps()

      add :access_mode, GroupAccessMode.type(), null: false
      add :name, :text, null: false
      add :slug, :text, null: false
      add :highlights, :text
      add :description, :text
      add :tags, {:array, :text}

      Utils.embeds(:settings)

      Utils.counter_cache_column("member")
      Utils.counter_cache_column("event")
      Utils.counter_cache_column("group_attachment")
    end

    # Add generated column to compute events score on count updates
    execute Utils.update_group_score_up(), Utils.update_group_score_down()
    execute Utils.add_generated_groups_score_column(), Utils.drop_generated_groups_score_column()

    create unique_index(:groups, [:slug], name: IndexNames.groups_unique_slug())
    create index(:groups, [:owner_id])
    create index(:groups, [:updated_at])
    create index(:groups, [:score])
    Utils.create_trigram_index(:groups, [:name, :highlights])

    #
    # Group Events
    #
    create table(:group_events, primary_key: false) do
      timestamps(updated_at: false)

      add :group_id, references(:groups, on_delete: :delete_all), null: false, primary_key: true
      add :event_id, references(:events, on_delete: :delete_all), null: false, primary_key: true
    end

    #
    # Group Members
    #
    create table(:group_members, primary_key: false) do
      timestamps(updated_at: false)

      add :group_id, references(:groups, on_delete: :delete_all), null: false, primary_key: true
      add :user_id, references(:users, on_delete: :delete_all), null: false, primary_key: true
      add :status, GroupMembershipStatus.type(), null: false
      add :membership_type, GroupMembershipType.type(), null: false

      # For settings like auto-subscribe to group events
      Utils.embeds(:settings)
    end

    # create index(:group_members, [:status])

    #
    # Activities
    #
    create table(:activities) do
      add :actor_id, references(:users, on_delete: :delete_all), null: false

      timestamps(updated_at: false)

      add :object_type, ActivityEntity.type(), null: false
      add :object_id, :binary_id, null: false
      add :activity_type, ActivityType.type(), null: false

      # Other optional activity specs
      #   e.g. target, result
      # Also hold summaries to avoid polymorphic joins
      #   e.g. actor_summary, object_summary, target_summary, result_summary
      Utils.embed_extended()
    end

    create index(:activities, [:actor_id])
    create index(:activities, [:object_id, :object_type])

    #
    # Activity Entries
    #
    create table(:activity_entries, primary_key: false) do
      add :user_id, references(:users, on_delete: :delete_all), null: false, primary_key: true

      add :activity_id, references(:activities, on_delete: :delete_all),
        null: false,
        primary_key: true

      timestamps(updated_at: false)
    end

    #
    # Products
    #
    create table(:products, primary_key: false) do
      add :id, :text, null: false, primary_key: true

      timestamps()

      add :title, :text, null: false
      add :description, :text
      add :purchase_model, PurchaseModel.type(), null: false

      # Includes manifests, and assets such as images
      Utils.embed_internal()
    end

    #
    # Receipts
    #
    create table(:receipts) do
      add :owner_id, references(:users, on_delete: :delete_all), null: false
      add :last_device_id, references(:devices, on_delete: :nilify_all)

      timestamps()
      Utils.soft_delete_column()
      add :verified_at, :utc_datetime_usec

      add :platform, DevicePlatform.type(), null: false

      # Decoded receipt from app store
      Utils.embed_internal()
    end

    create index(:receipts, [:owner_id])
    create index(:receipts, [:last_device_id], where: "last_device_id IS NOT NULL")

    #
    # Purchases
    #
    create table(:purchases) do
      add :owner_id, references(:users, on_delete: :delete_all), null: false
      add :product_id, references(:products, type: :text, on_delete: :restrict), null: false
      add :receipt_id, references(:receipts, on_delete: :nilify_all)
      add :last_device_id, references(:devices, on_delete: :nilify_all)

      timestamps()
      Utils.soft_delete_column()
      add :purchased_at, :utc_datetime_usec
      add :verified_at, :utc_datetime_usec

      add :platform, DevicePlatform.type(), null: false
      add :transaction_id, :text, null: false

      # Decoded transactions from purchase processor
      Utils.embed_internal()
    end

    create unique_index(:purchases, [:platform, :transaction_id],
             name: IndexNames.purchases_unique_platform_transaction()
           )

    create index(:purchases, [:owner_id])
    create index(:purchases, [:product_id])
    create index(:purchases, [:last_device_id], where: "last_device_id IS NOT NULL")

    #
    # Articles
    #
    create table(:articles) do
      add :author_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
      add :published_at, :utc_datetime_usec
      add :featured_at, :utc_datetime_usec

      add :article_type, ArticleType.type(), null: false
      add :title, :text, null: false
      add :slug, :text, null: false
      add :content, :text, null: false
      add :excerpt, :text, null: false
      add :tags, {:array, :text}

      # Translations
      Utils.embeds(:translations)

      Utils.embed_extended()
    end

    create unique_index(:articles, [:slug], name: IndexNames.articles_unique_slug())
    create index(:articles, [:author_id])
    create index(:articles, [:article_type])
    create index(:articles, [:published_at])
    create index(:articles, [:tags], using: "GIN")
    Utils.create_trigram_index(:articles, [:title, :excerpt])

    create table(:article_oembeds, primary_key: false) do
      timestamps()

      add :url, :text,
        null: false,
        primary_key: true

      add :oembed_type, :text,
        null: false,
        primary_key: true

      add :html, :text, null: false
      add :extended, :map
      add :expires_at, :utc_datetime_usec
    end

    #
    # Attachments
    #
    create table(:attachments) do
      timestamps(updated_at: false)
      Utils.soft_delete_column()

      add :owner_id, references(:users, on_delete: :delete_all)
      add :attachment_type, AttachmentType.type(), null: false
      add :attachment_provider, AttachmentProvider.type(), null: false
      Utils.embeds(:content_data, null: false)

      Utils.counter_cache_column("attached")
    end

    create index(:attachments, [:owner_id], where: "owner_id IS NOT NULL")

    #
    # Profile Attachments
    #
    for attachable <- ["user", "group"] do
      table_sym = to_atom("#{attachable}_attachments")
      attachable_id_sym = to_atom("#{attachable}_id")

      create table(table_sym, primary_key: false) do
        add attachable_id_sym,
            references(to_atom(pluralize(attachable)), on_delete: :delete_all),
            null: false,
            primary_key: true

        add :attachment_id, references(:attachments, on_delete: :delete_all),
          null: false,
          primary_key: true

        timestamps(updated_at: false)

        add :profile_attachment_type, ProfileAttachmentType.type(), null: false

        # Local image key
        Utils.embed_extended()
      end

      create unique_index(table_sym, [:profile_attachment_type, attachable_id_sym],
               name:
                 apply(
                   IndexNames,
                   to_atom("#{attachable}_attachments_unique_profile_attachment_type_name"),
                   []
                 )
             )
    end

    #
    # All other attachment links
    #
    for attachable <- ["article", "event", "countdown"] do
      create table(to_atom("#{attachable}_attachments"), primary_key: false) do
        add to_atom("#{attachable}_id"),
            references(to_atom(pluralize(attachable)), on_delete: :delete_all),
            null: false,
            primary_key: true

        add :attachment_id, references(:attachments, on_delete: :delete_all),
          null: false,
          primary_key: true

        timestamps(updated_at: false)

        # Local image key, ordinal, is_feature
        Utils.embed_extended()
      end
    end

    #
    # Addresses (with point locations)
    #

    for addressable <- ["user", "device", "event", "group"] do
      table_sym = to_atom("#{addressable}_addresses")
      fkey_sym = to_atom("#{addressable}_id")
      target_table_sym = to_atom(pluralize(addressable))

      create table(table_sym) do
        add fkey_sym, references(target_table_sym, on_delete: :delete_all), null: false

        timestamps(updated_at: false)

        add :street, :text
        add :street_others, {:array, :text}
        add :city, :text
        add :state, :text
        add :state_code, :text
        add :postal_code, :text
        add :country_code, :text

        # Fields like name and formatted entry
        Utils.embed_extended()

        # add :geometry, :geometry -- See more specific geometry spec below
      end

      execute "SELECT AddGeometryColumn ('#{table_sym}','geometry',4326,'POINT',2);", ""

      create constraint(
               table_sym,
               :country_code_is_uppercase,
               check: "UPPER(country_code) = country_code"
             )

      create index(table_sym, [fkey_sym])
    end

    #
    # KeyValues
    #
    create table(:key_values, primary_key: false) do
      add :id, :text, null: false, primary_key: true
      timestamps()
      Utils.embeds(:value)
    end

    #
    # Counter cache triggers
    #
    Utils.counter_cache_on_table(:users, :countdown_count, :countdowns, :owner_id)
    Utils.counter_cache_on_table(:users, :event_count, :events, :owner_id)
    Utils.counter_cache_on_table(:users, :follower_count, :follows, :followed_id)
    Utils.counter_cache_on_table(:users, :following_count, :follows, :follower_id)
    Utils.counter_cache_on_table(:users, :group_count, :groups, :owner_id)
    Utils.counter_cache_on_table(:users, :group_membership_count, :group_members, :user_id)
    Utils.counter_cache_on_table(:users, :user_attachment_count, :user_attachments, :user_id)

    Utils.counter_cache_on_table(:events, :countdown_count, :countdowns, :event_id)
    Utils.counter_cache_on_table(:events, :group_count, :groups, :event_id)
    Utils.counter_cache_on_table(:events, :event_attachment_count, :event_attachments, :event_id)

    Utils.counter_cache_on_table(:groups, :member_count, :group_members, :group_id)
    Utils.counter_cache_on_table(:groups, :event_count, :group_events, :group_id)
    Utils.counter_cache_on_table(:groups, :group_attachment_count, :group_attachments, :group_id)

    Utils.counter_cache_on_table(:attachments, :attached_count, :user_attachments, :attachment_id)

    Utils.counter_cache_on_table(
      :attachments,
      :attached_count,
      :article_attachments,
      :attachment_id
    )

    Utils.counter_cache_on_table(
      :attachments,
      :attached_count,
      :event_attachments,
      :attachment_id
    )

    Utils.counter_cache_on_table(
      :attachments,
      :attached_count,
      :countdown_attachments,
      :attachment_id
    )
  end
end
