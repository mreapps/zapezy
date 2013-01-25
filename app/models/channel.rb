class Channel < ActiveRecord::Base
  attr_accessible :base_url, :channel_id, :display_name, :sort_index, :selected

  attr_accessor :programmes

  validates :channel_id, :presence => true,
            :uniqueness => true
end
