class AddUserIdToPodcastTable < ActiveRecord::Migration[5.2]
  def change
    add_column :podcasts, :user_id, :integer
  end
end
