# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::Contract::Update do
  let(:contract) { create(:contract) }
  let(:contexts) {}
  let(:variables) {}

  let(:result) do
    TestMeSchema.execute(
      query_string,
      context: contexts,
      variables: variables
    )
  end

  context 'update the contract' do
    let(:status) { 'signed' }
    let(:name) { 'unique name' }
    let(:start_date) { '2023-03-03' }
    let(:avg_monthly_price) { 123 }

    let(:query_string) do
      "mutation {
         updateContract(id: #{contract.id}, contract: {
           status: #{status},
           name: \"#{name}\",
           startDate: \"#{start_date}\",
           avgMonthlyPrice: #{avg_monthly_price}
         }) {
           contract {
             id
             status,
             startDate,
             name,
             avgMonthlyPrice
           },
           errors
         }
       }"
    end

    it 'response includes described attributes' do
      keys = %w[id status startDate name avgMonthlyPrice]
      expect(result['data']['updateContract']['contract']).to include(*keys)
    end

    it 'response includes correct status' do
      result_status = result.dig('data', 'updateContract', 'contract', 'status')
      expect(result_status).to eq status
    end

    it 'response includes correct name' do
      result_name = result.dig('data', 'updateContract', 'contract', 'name')
      expect(result_name).to eq name
    end

    it 'response includes correct start_date' do
      result_start_date = result.dig('data', 'updateContract', 'contract',
                                     'startDate')
      expect(result_start_date).to eq start_date
    end

    it 'response includes correct avg_monthly_price' do
      result_avg_monthly_price = result.dig('data', 'updateContract',
                                            'contract', 'avgMonthlyPrice')
      expect(result_avg_monthly_price).to eq avg_monthly_price
    end

    context 'includes errors' do
      include_context 'mutation_contract_status_errors_context'
      include_context 'mutation_contract_name_errors_context',
                      'updateContract'

      context 'name must be uniq' do
        let(:contract2) { create(:contract) }
        let(:name) { contract2.name }

        context 'includes errors' do
          it 'result includes correct errors' do
            error = result['data']['updateContract']['errors'].first
            expect(error).to eq 'Name has already been taken'
          end
        end
      end

      include_context 'mutation_contract_start_date_errors_context',
                      'updateContract'

      include_context 'mutation_contract_avg_monthly_price_errors_context'
    end
  end
end
