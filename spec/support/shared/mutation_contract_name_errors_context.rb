# frozen_string_literal: true

require 'rails_helper'

# easy to use inside controllers only =)
shared_context 'mutation_contract_name_errors_context' do |method|
  context 'name' do
    it 'result includes errors key' do
      expect(result['data'][method]).to include('errors')
    end

    context 'must be present' do
      let(:name) { nil }

      it 'result includes correct errors' do
        error = result['data'][method]['errors'].first
        expect(error).to eq 'Name can\'t be blank'
      end
    end

    context 'length greater than 255' do
      let(:name) { 'c' * 256 }

      it 'result includes correct errors' do
        error = result['data'][method]['errors'].first
        expect(error).to eq 'Name is too long (maximum is 255 characters)'
      end
    end
  end
end
