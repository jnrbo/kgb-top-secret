module Services
  class RateReviews
    def initialize
      @words = {
        :very => 0.2,
        :great => 0.3,
        :highly => 0.4,
        :best => 0.4,
        :awesome => 0.5,
        :amazing => 0.5,
        :super => 0.6,
        :extremely => 0.6,
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
      sorted = top_reviews.sort_by! { |v| -v[:rate] }
      top3 = sorted[0..2]
      top3
    end

    private

    def get_rate(text, word)
      key, weight = word
      r = /\b#{key}\b/i
      text.scan(r).count * weight
    end

    def calculate_rate(text)
      score = 0.0
      @words.each do |word|
        score += get_rate(text, word)
      end
      score * Math.sqrt(text.length)
    end
  end
end