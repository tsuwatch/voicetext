require "voicetext/version"
require 'net/http'
require 'uri'

class Voicetext

  class BadRequest < StandardError; end
  class Unauthorized < StandardError; end

  SPEAKERS = {
    SHOW:  'show',
    HARUKA: 'haruka',
    HIKARI: 'hikari',
    TAKERU: 'takeru'
  }.freeze

  EMOTIONS = {
    HAPPINESS: 'happiness',
    ANGER: 'anger',
    SADNESS: 'sadness7'
  }.freeze

  EMOTION_LEVELS = {
    HIGH: 2,
    NORMAL: 1
  }.freeze

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
      req.body = build(text, speaker, options)
      res = https.request(req)
    end

    case res
    when Net::HTTPOK
      res.body
    when Net::HTTPBadRequest
      raise BadRequest.new(res.body)
    when Net::HTTPUnauthorized
      raise Unauthorized.new(res.body)
    else
      raise StandardError.new(res.body)
    end

  end

  private

  def build(text, speaker, options)
    data = "text=#{text}&speaker=#{speaker}"
    data << "&emotion=#{options[:emotion]}" if options[:emotion]
    data << "&emotion_level=#{options[:emotion_level]}" if options[:emotion_level]
    data << "&pitch#{options[:pitch]}" if options[:pitch]
    data << "&speed#{options[:speed]}" if options[:speed]
    data << "&volume#{volume[:volume]}" if options[:volume]
    data
  end

end
