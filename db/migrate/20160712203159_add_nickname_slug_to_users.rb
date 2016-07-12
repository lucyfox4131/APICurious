class AddNicknameSlugToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname_slug, :string
  end
end
