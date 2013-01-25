class EpgController < ApplicationController
  def refresh
    EpgUpdateTask.new.refresh
    flash[:notice] = "Oppdatert - " + Channel.all.size.to_s
  end

  def epglist
    channel_id = "tv2.no"
    now = DateTime.now
    later = DateTime.now + 1
    @channels = Channel.where("selected=:selected", {:selected => true}).order("sort_index asc")
    @channels.each do |channel|
      channel.programmes = Programme.where("channel_id=:channel_id and (start between :now and :later or (start<:now and stop>:now))", {:channel_id => channel.channel_id, :now => now, :later => later}).order("start asc")
    end

    s = ""
  end

end
