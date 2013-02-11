class ChangesSubscriptionStartsAtToStartedAt < ActiveRecord::Migration
  def change
    rename_column :users, :subscription_start_at, :subscription_started_at
  end
end
