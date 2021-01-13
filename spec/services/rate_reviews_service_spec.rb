# frozen_string_literal: true

require 'rails_helper'

describe Services::RateReviews do

  let!(:review1) {
    {
      review: "amazing great seller extremely extremely",
      user: "junior_barros"
    }
  }

  let!(:review2) {
    {
      review: "best seller ever",
      user: "moe_tompkins"
    }
  }

  let!(:review3) {
    {
      review: "extremely super great seller ",
      user: "jake_hasler"
    }
  }

  let!(:review4) {
    {
      review: "random comment",
      user: "random"
    }
  }

  let!(:reviews) {
    [
      review1,
      review2,
      review3,
      review4
    ]
  }

  subject do
    described_class.new
  end

  describe '#get_top_reviews' do
    context 'with all reviews' do
      it 'return top 3 reviews sorted' do
        top3 = subject.get_top_reviews(reviews)
        expect(top3.map { |r| r[:user] }).to eq [review1, review3, review2].map { |r| r[:user] }
      end
    end
  end

  describe '#calculate_rate' do
    context 'with required parameters' do
      it 'calculate rate of review1' do
        rate = subject.calculate_rate(review1[:review])
        expect(rate).to eq 4.0
      end

      it 'calculate rate of review2' do
        rate = subject.calculate_rate(review2[:review])
        expect(rate).to eq 0.5060
      end

      it 'calculate rate of review3' do
        rate = subject.calculate_rate(review3[:review])
        expect(rate).to eq 2.5544
      end

      it 'calculate rate of review4' do
        rate = subject.calculate_rate(review4[:review])
        expect(rate).to eq 0.0
      end
    end
  end

end