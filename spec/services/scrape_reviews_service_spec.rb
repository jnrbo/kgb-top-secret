# frozen_string_literal: true

require 'rails_helper'

describe Services::ScrapeReviews do

  describe '#url' do
    context 'with page number' do
      it 'return correct url' do
        url = subject.url(3)
        expect(url).to eq 'https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page3/?filter=ONLY_POSITIVE&__optvLead=3#link'
      end
    end
  end

  describe '#call' do
    ENV['MAX_PAGES'] = '1'
    context 'when max_pages = 1' do
      it 'return all reviews from pages' do
        VCR.use_cassette('dealerrater_page1') do
          reviews = subject.call

          expect(reviews.size).to eq 10

          expect(reviews[0]).to eq ({
            review: 'This dealership and their team went above and beyond to get myself and my spouse into new vehicles and lowered our payments!!  AMAZING! from top to bottom!',
            user: 'aandrewslp'
          })
        end
      end
    end
  end

  describe '#show_ranking' do
    context 'when you alreeady have reviews' do
      it 'prints review' do
        subject.show_ranking([])
      end
    end
  end


end