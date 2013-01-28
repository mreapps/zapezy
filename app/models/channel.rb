class Channel < ActiveRecord::Base
  attr_accessible :base_url, :channel_id, :display_name, :sort_index, :selected, :live_tv_url

  attr_accessor :programmes, :current_programme, :next_programme, :current_progress

  validates :channel_id, :presence => true,
            :uniqueness => true
end
