require "voicetext/version"
require 'net/http'
require 'uri'

class Voicetext

  class << self

    def speakers
      ['show', 'haruka', 'hikari', 'takeru']
    end

    def emotions
      ['happiness', 'anger', 'sadness']
    end

  end

  def initialize(api_key)
    @api_key = api_key
  end
  
  def tts(text, speaker, options = {})
    res = nil
    uri = URI('https://api.voicetext.jp/v1/tts')
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true
    http.start do |https|
      req = Net::HTTP::Post.new(uri.path)
      req.basic_auth(@api_key, '')
      req.body = body(text, speaker, options)
      res = https.request(req)
    end
    res.body
  end

  def valid_pitch_range?(pitch)
    pitch.between?(50, 200)
  end

  def valid_speed_range?(speed)
    speed.between?(50, 400)
  end

  def valid_volume_range?(volume)
    volume.between?(50, 200)
  end

  private

  def body(text, speaker, options)
    data = "text=#{text}&speaker=#{speaker}"
    data << "&emotion=#{options[:emotion]}" if options[:emotion]
    data << "&emotion_level=#{options[:emotion_level]}" if options[:emotion_level]
    data << "&pitch#{options[:pitch]}" if options[:pitch]
    data << "&speed#{options[:speed]}" if options[:speed]
    data << "&volume#{volume[:volume]}" if options[:volume]
    data
  end

end
