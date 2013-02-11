class AddSubscriptionAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :subscription_profile_id , :string
    add_column :users, :subscription_token      , :string
    add_column :users, :subscription_start_at , :date
  end
end
