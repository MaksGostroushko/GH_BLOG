class AddPublishedToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :published, :boolean, default: false
  end
end
