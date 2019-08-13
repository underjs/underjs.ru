require 'uri'


IMAGE_PATH = Jekyll.configuration({})["defaults"]["path"]

module Jekyll
  class OtherPlayersTag < Liquid::Tag
    def initialize(tag_name, urls, token)
      super
      @urls = Hash[urls.split(" ").map{|url| [URI.parse(url).host, url]}]
      @config = Jekyll.configuration({})['other_players'] || {}
    end

    def render(context)
      anchors = @urls.map{|k, url| "<li><a href='#{url}' target='_blank'><img src='#{IMAGE_PATH}/#{k}.png' title='#{k}' alt='#{k}'/></a></li>" } 
      return "<ul class='other-players'>#{anchors.join("")}</ul>"
    end
  end
end

Liquid::Template.register_tag('other_players', Jekyll::OtherPlayersTag)
