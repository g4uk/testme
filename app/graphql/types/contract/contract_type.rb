# frozen_string_literal: true

module Types::Contract
  class ContractType < Types::BaseObject
    graphql_name 'Contract'
    description 'A contract with status, name, start_date and average monthly
price'

    field :id, ID, null: false,
          description: 'Contract ID'
    field :status, ContractStatusEnum, null: false,
          description: 'Contract status'
    field :name, String, null: false,
          description: 'Name of the contract'
    field :start_date, Types::Iso8601DateType, null: false,
          description: 'Start date of the contract'
    field :avg_monthly_price, Float, null: true,
          description: 'The average monthly price of the contract'
  end
end
