# frozen_string_literal: true

require 'rails_helper'

# easy to use inside controllers only =)
shared_context 'mutation_contract_status_errors_context' do
  context 'status' do
    context 'is incorrect' do
      let(:status) { 'bad_status' }

      it 'result includes errors key' do
        expect(result).to include('errors')
      end

      before(:each) do
        @extensions = result['errors'].first['extensions']
      end

      it 'errors includes status argumentName' do
        expect(@extensions['argumentName']).to eq 'status'
      end

      it 'has argument error' do
        expect(@extensions['code']).to eq 'argumentLiteralsIncompatible'
      end
    end
  end
end
