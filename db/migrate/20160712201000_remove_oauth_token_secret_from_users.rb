class RemoveOauthTokenSecretFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :oauth_token_secret
  end
end
