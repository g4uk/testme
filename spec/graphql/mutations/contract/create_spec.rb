# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::Contract::Create do
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

  context 'create a contract' do
    let(:status) { 'signed' }
    let(:name) { 'unique name' }
    let(:start_date) { '2023-03-03' }
    let(:avg_monthly_price) { 123 }

    let(:query_string) do
      "mutation {
         createContract(contract: {
           status: #{status},
           name: \"#{name}\",
           startDate: \"#{start_date}\",
           avgMonthlyPrice: #{avg_monthly_price}
         }) {
           contract {
             id
             status,
             startDate
           },
           errors
         }
       }"
    end

    it 'count up to 1' do
      expect { result }.to change { Contract.count }.by(1)
    end

    it 'response includes described attributes' do
      keys = %w[id status startDate]
      expect(result['data']['createContract']['contract']).to include(*keys)
    end

    context 'includes errors' do
      include_context 'mutation_contract_status_errors_context'
      include_context 'mutation_contract_name_errors_context',
                      'createContract'

      context 'name must be uniq' do
        let(:contract) { create(:contract) }
        let(:name) { contract.name }

        context 'includes errors' do
          it 'result includes correct errors' do
            error = result['data']['createContract']['errors'].first
            expect(error).to eq 'Name has already been taken'
          end
        end
      end

      include_context 'mutation_contract_start_date_errors_context',
                      'createContract'

      context 'must not be present' do
        let(:query_string) do
          "mutation {
               createContract(contract: {
                 status: #{status},
                 name: \"#{name}\",
                 startDate: \"#{start_date}\"
               }) {
                 contract {
                   id
                   status,
                   startDate
                 },
                 errors
               }
             }"
        end

        it 'count up to 1' do
          expect { result }.to change { Contract.count }.by(1)
        end
      end

      include_context 'mutation_contract_avg_monthly_price_errors_context'
    end
  end
end
