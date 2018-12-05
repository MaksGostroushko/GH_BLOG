class AddViewsCountToMicropost < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :views_count, :integer, default: 0
  end
end
