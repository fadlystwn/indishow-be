class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :password_confirmation, :string
  end
end
