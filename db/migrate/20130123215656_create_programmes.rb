class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
      t.string :channel_id
      t.datetime :start
      t.datetime :stop
      t.string :title
      t.string :sub_title
      t.string :desc
      t.integer :date

      t.timestamps
    end
  end
end
