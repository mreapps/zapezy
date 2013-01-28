class LiveTvController < ApplicationController
  def index
    channel = Channel.where("selected=:selected", {:selected => true}).order("sort_index asc").first
    redirect_to live_tv_show_path(:id => channel.id)
  end

  def show
    @channels = Channel.where("selected=:selected", {:selected => true}).order("sort_index asc")
    @channels.each do |channel|
      get_current_and_next_programme(channel)
    end

    id = params[:id]
    if id.nil?
      @selected_channel = @channels.first
    else
      @selected_channel = Channel.find(params[:id])
      get_current_and_next_programme(@selected_channel)
    end

    render :layout => false
  end

  def get_current_and_next_programme (channel)
    now = DateTime.now
    channel.current_programme = Programme.where("channel_id=:channel_id and start<=:now and stop>=:now", {:channel_id => channel.channel_id, :now => now}).first
    unless channel.current_programme.nil?

      elapsed = (now - channel.current_programme.start.to_datetime).to_d
      total = (channel.current_programme.stop.to_datetime - channel.current_programme.start.to_datetime).to_d
      progress = ((elapsed / total) * 100).to_i
      channel.current_progress = progress
      channel.next_programme = Programme.where("channel_id=:channel_id and start>=:later", {:channel_id => channel.channel_id, :later => channel.current_programme.stop}).order("start asc").first
    end
  end
end
