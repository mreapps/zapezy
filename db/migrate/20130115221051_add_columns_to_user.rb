class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :integer
    add_column :users, :birthday, :date
  end
end
