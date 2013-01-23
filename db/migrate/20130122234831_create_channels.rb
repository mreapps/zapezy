class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :channel_id
      t.string :display_name
      t.string :base_url

      t.timestamps
    end
  end
end
