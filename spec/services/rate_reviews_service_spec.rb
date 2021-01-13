# frozen_string_literal: true

require 'rails_helper'

describe Services::RateReviews do

  let(:reviews) {
    [
      {
        review: "amazing great seller extremely extremely",
        user: "junior_barros"
      },
      {
        review: "best seller ever",
        user: "moe_tompkins"
      },
      {
        review: "extremely super great seller ",
        user: "jake_hasler"
      },
      {
        review: "random comment",
        user: "random"
      }
    ]
  }

  subject do
    described_class.new
  end

  describe '#get_top_reviews' do
    context 'with required parameters' do

      it 'sort and slice top reviews by rate' do
        subject.get_top_reviews(reviews)
        # expect(new_operation_center.name).to eq name
      end
    end
  end
end