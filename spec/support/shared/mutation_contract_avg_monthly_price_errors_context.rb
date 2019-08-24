# frozen_string_literal: true

require 'rails_helper'

# easy to use inside controllers only =)
shared_context 'mutation_contract_avg_monthly_price_errors_context' do
  context 'avg_monthly_price' do
    context 'is digit if present' do
      let(:avg_monthly_price) { 'string' }

      it 'result includes error' do
        expect(result).to include 'errors'
      end

      it 'must be float' do
        error = result['errors'].first['extensions']['code']
        expect(error).to eq 'argumentLiteralsIncompatible'
      end
    end
  end
end
