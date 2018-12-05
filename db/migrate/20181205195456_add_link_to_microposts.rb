class AddLinkToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :link, :string
  end
end
