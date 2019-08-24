# frozen_string_literal: true

module Types::Contract
  class ContractInput < Types::BaseInputObject
    graphql_name 'ContractInput'
    description 'Input Object for Contract'

    argument :status, ContractStatusEnum, required: true,
             description: 'Contract status'
    argument :name, String, required: true,
             description: 'Contract name (uniq)'
    argument :start_date, Types::Iso8601DateType, required: true,
             description: 'Contract start date'
    argument :avg_monthly_price, Float, required: false,
             description: 'Average monthly price of the contract'
  end
end
