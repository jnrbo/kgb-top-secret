require 'net/http'
require 'uri'
require 'json'

module Services
  class GetScrapeReviews

    def initialize
      puts "TODO"
      []
    end

    def get_review(page)
      request url page
    end


    private

    def request(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.port == 443

      request = Net::HTTP::Post.new(uri.request_uri, headers)

      http.request(request)
    end

    def url(page)
      "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page#{page}/?filter=#link"
      "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-review-23685/"
    end

  end
end