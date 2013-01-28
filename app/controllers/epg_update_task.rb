require "net/http"
require 'zlib'

require "open-uri"
require "nokogiri"

class EpgUpdateTask
  def refresh
    url = "http://data.epg.no/xmltv/channels.xml.gz"

    gz = Zlib::GzipReader.new(open(url))
    doc = Nokogiri::XML(gz)

    @channels = doc.xpath('//tv/channel').map do |channel|
      {
          :channel_id => channel.xpath("@id").text,
          :display_name => channel.xpath("display-name").text,
          :base_url => channel.xpath("base-url").text
      }
    end

    @channels.each do |channel|
      c = Channel.where("channel_id=?", channel[:channel_id])
      if c.blank?
        c = Channel.new(:channel_id => channel[:channel_id])
      else
        c = c.first
      end

      c.display_name = channel[:display_name]
      c.base_url = channel[:base_url]
      c.save

      # refresh programmes for 14 days
      today = Date.today
      14.times {
        url = channel[:base_url]+channel[:channel_id]+"_"+today.to_s+".xml.gz"
        gz = Zlib::GzipReader.new(open(url))
        doc = Nokogiri::XML(gz)
        @programmes = doc.xpath("//tv/programme").map do |programme|
          {
              :start => programme.xpath("@start").text,
              :stop => programme.xpath("@stop").text,
              :channel_id => programme.xpath("@channel").text,
              :title => programme.xpath("title").text,
              :sub_title => programme.xpath("sub-title").text,
              :desc => programme.xpath("desc").text,
              :date => programme.xpath("date").text
          }
        end

        @programmes.each do |programme|
          start = nil
          unless programme[:start].blank?
            start = DateTime.parse(programme[:start]).to_datetime
          end
          stop = nil
          unless programme[:stop].blank?
            stop = DateTime.parse(programme[:stop]).to_datetime
          end

          p = Programme.new(:channel_id => programme[:channel_id], :start => start)
          list = Programme.where("channel_id=? and start=?", p.channel_id, p.start)
          unless list.first.nil?
            p = list.first
          end

          p.stop = stop
          p.title = programme[:title]
          p.sub_title = programme[:sub_title]
          p.desc = programme[:desc]
          p.date = programme[:date]
          p.save

        end

        DateTime.parse()

        today = today + 1
      }
    end

  end
  #handle_asynchronously :refresh
end