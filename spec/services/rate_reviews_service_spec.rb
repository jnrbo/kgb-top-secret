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

  describe '#words' do
    context 'with no parameter' do
      it 'return all words and weights' do
        words = subject.words
        expect(words.length).to eq 10

        expect(words[:very]).to eq 0.2
        expect(words[:want]).to eq 0.2
        expect(words[:great]).to eq 0.3
        expect(words[:really]).to eq 0.3
        expect(words[:highly]).to eq 0.4
        expect(words[:best]).to eq 0.4
        expect(words[:awesome]).to eq 0.5
        expect(words[:amazing]).to eq 0.5
        expect(words[:super]).to eq 0.6
        expect(words[:extremely]).to eq 0.6
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