class AddChannelFields < ActiveRecord::Migration
  def up
    add_column :channels, :sort_index, :integer
    add_column :channels, :selected, :boolean
  end

  def down
    remove_column :channels, :sort_index
    remove_column :channels, :selected
  end
end
