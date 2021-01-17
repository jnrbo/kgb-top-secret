# frozen_string_literal: true

module Services
  class RateReviews
    def words
      {
        very: 0.2,
        want: 0.2,
        great: 0.3,
        really: 0.3,
        highly: 0.4,
        best: 0.4,
        awesome: 0.5,
        amazing: 0.5,
        super: 0.6,
        extremely: 0.6
      }
    end

    def get_top_reviews(reviews)
      top_reviews = []
      reviews.each do |review|
        top_reviews << {
          review: review[:review],
          user: review[:user],
          rate: calculate_rate(review[:review])
        }
      end
      sort_and_slice(top_reviews)
    end

    def sort_and_slice(top_reviews)
      sorted = top_reviews.sort_by! { |v| -v[:rate] }
      sorted[0..2]
    end

    def get_rate(text, word)
      key, weight = word
      r = /(?=#{key})/
      text.scan(r).count * weight
    end

    def calculate_rate(text)
      low_text = text.downcase
      score = 0.0
      words.each do |word|
        score += get_rate(low_text, word)
      end

      puts score
      puts text.length
      puts "-------"
      (score * Math.sqrt(text.length * 0.1)).round(4)
    end
  end
end
