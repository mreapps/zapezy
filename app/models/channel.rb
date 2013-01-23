class Channel < ActiveRecord::Base
  attr_accessible :base_url, :channel_id, :display_name

  validates :channel_id, :presence => true,
            :uniqueness => true
end
