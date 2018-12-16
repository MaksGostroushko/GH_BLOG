class AddLikesCountToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :likes_count, :integer
  end
end
