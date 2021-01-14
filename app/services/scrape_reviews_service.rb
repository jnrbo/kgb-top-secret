# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

module Services
  class ScrapeReviews
    def max_pages
      ENV['MAX_PAGES'] ? ENV['MAX_PAGES'].to_i : 5
    end

    def call
      reviews = []

      (1..max_pages).each do |page|
        reviews += get_reviews_from_page(page)
      end

      reviews
    end

    def get_reviews_from_page(page)
      puts "Getting review from page #{page}.."
      page = Services::Html.new(url(page))
      entries = page.element('.review-entry')

      entries.map do |entry|
        {
          review: page.value(entry, '.review-content'),
          user: page.value(entry, '.margin-bottom-sm span.italic.font-18').gsub!('- ', '')
        }
      end
    end

    def show_ranking(reviews)
      reviews.each do |rev|
        puts "User: #{rev[:user]} (IP: #{ip})"
        puts "Score: #{rev[:rate]}"
        puts "Review: #{rev[:review]}\n\n"
      end
    end

    def url(page)
      "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page#{page}/?filter=ONLY_POSITIVE&__optvLead=3#link"
    end
  end
end
