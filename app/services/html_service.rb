require 'net/http'
require 'uri'
require 'json'

module Services
  class HtmlService
    @page

    def initialize(url)
      body = request(url).body
      @page = Nokogiri::HTML.parse(body)
    end


    def search(query)
     @page.css(query).map(&:text)
    end

    private

    def request(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.port == 443
      headers = {
        'User-Agent': 'KGB/37.26.8'
      }

      request = Net::HTTP::Post.new(uri.request_uri, headers)

      http.request(request)
    end

  end
end