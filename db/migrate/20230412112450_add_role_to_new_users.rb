class AddRoleToNewUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :new_users, :role, :integer
  end
end
