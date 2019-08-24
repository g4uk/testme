# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::Iso8601DateType do
  let(:date_string) { '2010-10-10' }
  let(:date) { Date.parse(date_string) }

  context 'type works correct' do
    it 'date converted to iso8601' do
      expect(described_class.coerce_result(date, nil)).to eq date.iso8601
    end

    it 'date string is parsed' do
      expect(described_class.coerce_input(date_string, nil)).to be_a(Date)
    end
  end
end
