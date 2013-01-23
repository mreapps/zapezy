class EpgController < ApplicationController
  def refresh
    EpgUpdateTask.new.refresh
    flash[:notice] = "Oppdatert - " + Channel.all.size.to_s
  end

  def epglist
    now = DateTime.now
    later = DateTime.now + 1

    @programmes = Programme.where("channel_id=:channel_id and (start between :now and :later or (start<:now and stop>:now))", {:channel_id => "nrk1.nrk.no", :now => now, :later => later}).order("start asc")
  end

end
