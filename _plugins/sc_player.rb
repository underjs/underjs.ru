# SoundCloud player tag.
#
# Generates a SoundCloud player widget from any valid URI: track, playlist or user.
#
# Usage:
#
#   {% sc_player uri %}
#
# Example:
#
#   {% sc_player https://soundcloud.com/waek/daze-ft-girl-is-tough-new-york %}
#
# Configuration (in _config.yml):
#
#   sc_player:
#     auto_play: false
#     buying: true
#     liking: true
#     download: true
#     sharing: true
#     show_artwork: true
#     show_comments: true
#     show_playcount: true
#     show_user: true
#     start_track: 0
#
# Author: Mathieu Bernard
# Plugin Source: http://github.com/itsbrnrd/jekyll_sc_player
# Site Source: http://github.com/itsbrnrd/jekyll_sc_player
# Plugin License: MIT

require 'uri'

module Jekyll
  class SCPlayerTag < Liquid::Tag
    def initialize(tag_name, config, token)
      super

      @uris  = URI.extract(config)

      @config = Jekyll.configuration({})['sc_player'] || {}
    end

    def render(context)
      html = ""

      @uris.each_with_index do |uri, index|
        html << "<iframe id='sc-widget-#{index}' src='https://w.soundcloud.com/player/?url=#{uri}&#{URI.encode_www_form(@config)}' width='100%' scrolling='no' frameborder='no'></iframe>"
      end
      return html
    end
  end
end

Liquid::Template.register_tag('sc_player', Jekyll::SCPlayerTag)
