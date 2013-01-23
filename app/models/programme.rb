class Programme < ActiveRecord::Base
  attr_accessible :channel_id, :date, :desc, :start, :stop, :sub_title, :title

  validates :channel_id, :presence => true
  validates :start, :presence => true
  validates :title, :presence => true
  validates :stop, :presence => true
end
