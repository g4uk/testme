# frozen_string_literal: true

require 'rails_helper'

# easy to use inside controllers only =)
shared_context 'mutation_contract_start_date_errors_context' do |method|
  context 'start_date' do
    context 'must be present' do
      let(:start_date) { nil }

      it 'result includes correct errors' do
        error = result['errors'].first['extensions']
        expect(error['code']).to eq 'argumentLiteralsIncompatible'
      end
    end

    context 'must be in the future or today' do
      let(:start_date) { Date.yesterday }

      it 'result includes error' do
        error = result['data'][method]['errors'].first
        expect(error).to eq 'Start date in the past'
      end
    end
  end
end
