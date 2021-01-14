# frozen_string_literal: true

require 'rails_helper'
require 'vcr'

describe Services::Html do

  subject { described_class.new("https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page1/?filter=ONLY_POSITIVE&__optvLead=3#link") }

  describe '#value' do
    context 'when loads page and element' do
      it 'returns element value as text' do
        VCR.use_cassette('dealerrater_page1') do
          element = subject.element("#dealerName")
          expect(subject.value(element, "h1")).to eq "McKaig Chevrolet Buick - A Dealer For The People"
        end
      end
    end
  end
end