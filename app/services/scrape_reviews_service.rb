require 'net/http'
require 'uri'
require 'json'


module Services
  class GetScrapeReviews

    MAX_PAGES = 7

    def call
      reviews = []

      (0..MAX_PAGES).each do |page|
        reviews += get_reviews_from_page(page)
      end

      reviews
    end

    def get_reviews_from_page(page)
      page = Services::HtmlService.new(url(page))
      entries = page.element(".review-entry")

      entries.map do |entry|
        {
          review: page.value(entry, ".review-content"),
          user: page.value(entry, ".margin-bottom-sm span.italic.font-18").gsub!("- ", ''),
        }
      end
    end

    def show_ranking(reviews)
      reviews.each do |rev|
        puts "User: #{rev[:user]} (#{ip})"
        puts "Rate: #{rev[:rate]}"
        puts "Review: #{rev[:review]}\n\n"
      end
    end

    def url(page)
      "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page#{page}/?filter=ONLY_POSITIVE&__optvLead=3#link"
    end

  end
end