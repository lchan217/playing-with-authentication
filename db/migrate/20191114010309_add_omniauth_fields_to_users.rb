class AddOmniauthFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar_url, :string
    add_column :users, :email, :string
    add_column :users, :uid, :string
    add_column :users, :username, :string
    add_column :users, :password, :string
    add_column :users, :password_digest, :string
    add_column :users, :provider, :string
    add_column :users, :oauth_token, :string
  end
end
