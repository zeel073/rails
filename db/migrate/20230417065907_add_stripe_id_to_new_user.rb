class AddStripeIdToNewUser < ActiveRecord::Migration[7.0]
  def change
    add_column :new_users, :StripeId, :string
  end
end
