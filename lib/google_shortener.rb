require 'net/http'
require 'json'

class GoogleShortener
  attr_accessor :api_key

  PROJECTIONS = ['FULL', 'ANALYTICS_CLICKS', 'ANALYTICS_TOP_STRINGS']

  def initialize
    @api_key = 'AIzaSyDOY31us5qGR_MdMQKaTfGlhpOi8w3Ur7U'
  end

  def shorten(long_url)
    raise ArgumentError, "Long URL should be a String" unless long_url.is_a?(String)

    if long_url.empty?
      raise ArgumentError, 'Long URL is required'
    end

    res = post_to_google_url_shortener_api(long_url)
    res_body = JSON.load(res.body)

    if res.is_a? Net::HTTPSuccess
      res_body['id']
    else
      res_body
    end
  end

  def expand(short_url)
    raise ArgumentError, "Short URL should be a String" unless short_url.is_a?(String)

    if short_url.empty?
      raise ArgumentError, 'Short URL is required'
    end
    res = get_from_google_url_shortener_api(short_url)
    res_body = JSON.load(res.body)

    if res.is_a?(Net::HTTPSuccess)
      res_body['longUrl']
    else
      res_body
    end
  end

  def analytics(short_url, projection='FULL')
    raise ArgumentError, "Short URL should be a String" unless short_url.is_a?(String)

    if short_url.empty?
      raise ArgumentError, 'Short URL is required'
    end

    raise ArgumentError, "Projection should be a String" unless projection.is_a?(String)
    raise ArgumentError, "Projection can only be #{PROJECTIONS.join(',')}" unless PROJECTIONS.include?(projection)

    res = get_from_google_url_shortener_api(short_url, {'projection' => projection})
    res_body = JSON.load(res.body)
  end

  def valid_api_key?
    res = post_to_google_url_shortener_api('http://www.google.com')

    if res.is_a?(Net::HTTPSuccess)
      true
    else
      false
    end
  end

  private

  def google_url_shortener_location
    'https://www.googleapis.com/urlshortener/v1/url'
  end

  def get_from_google_url_shortener_api(short_url, options = {})
    uri = URI(google_url_shortener_location)
    params = {'shortUrl' => short_url, 'key' => @api_key}
    params = params.merge(options) unless options.empty?
    uri.query = URI.encode_www_form(params)
    req = Net::HTTP::Get.new(uri.request_uri)
    req.content_type = 'application/json'
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
      http.request(req)
    end
  end

  def post_to_google_url_shortener_api(long_url)
    uri = URI(google_url_shortener_location)
    req = Net::HTTP::Post.new(uri.path)
    req.body = JSON.dump({'longUrl' => long_url, 'key' => @api_key})
    req.content_type = 'application/json'

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
      http.request(req)
    end
  end
end
