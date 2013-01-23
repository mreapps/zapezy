class AddIndexToProgramme < ActiveRecord::Migration
  def change
    add_index :programmes, [:channel_id, :start], :name => 'programmes_key', :unique => true
  end
end
