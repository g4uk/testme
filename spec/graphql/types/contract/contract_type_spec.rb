# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::Contract::ContractType do
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

  context 'Contracts query' do
    context 'get contract by id' do
      context 'missing ID' do
        let(:query_string) { '{ contract {} }' }

        it 'should return contract errors' do
          expect(result['errors']).not_to be_blank
        end
      end

      context 'return all attributes' do
        let(:query_string) do
          "{ contract(id: #{contract.id}) {
            id, status, name, startDate, avgMonthlyPrice
          } }"
        end

        it 'contract should not to be blank' do
          expect(result['data']).not_to be_blank
        end

        it 'contract should not to be empty' do
          expect(result['data']).not_to be_empty
        end

        it 'contract should includes id' do
          expect(result['data']['contract']).to have_key('id')
        end

        it 'contract should includes status' do
          expect(result['data']['contract']).to have_key('status')
        end

        it 'contract should includes name' do
          expect(result['data']['contract']).to have_key('name')
        end

        it 'contract should includes startDate' do
          expect(result['data']['contract']).to have_key('startDate')
        end

        it 'contract should includes avgMonthlyPrice' do
          expect(result['data']['contract']).to have_key('avgMonthlyPrice')
        end
      end
    end

    context 'Listing all contracts' do
      before { create_list(:contract, 5) }

      context 'all contracts with no constraints' do
        let(:query_string) do
          '{ contracts{ id, status, name, startDate, avgMonthlyPrice } }'
        end

        it 'should have a list of contracts' do
          expect(result['data']['contracts'].length).to eq 5
        end
      end
    end
  end
end
