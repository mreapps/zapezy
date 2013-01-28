class AddLiveTvUrlToChannel < ActiveRecord::Migration
  def change
    add_column :channels, :live_tv_url, :string
  end
end
