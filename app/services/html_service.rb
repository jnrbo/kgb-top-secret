# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

module Services
  class Html
    def initialize(url)
      body = request(url).body
      @page = Nokogiri::HTML.parse(body)
      @page
    end

    def value(element, query)
      element.css(query).text
    end

    def element(query)
      @page.css(query)
    end

    private

    def request(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.port == 443
      headers = {
        'User-Agent': 'KGB/37.26.8'
      }

      request = Net::HTTP::Get.new(uri.request_uri, headers)

      http.request(request)
    end
  end
end
