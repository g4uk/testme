# frozen_string_literal: true

module Mutations::Contract
  class Update < GraphQL::Schema::Mutation
    graphql_name 'UpdateContract'
    description 'Update existing contract'

    null false

    argument :id, ID, required: true,
             description: 'Contract ID'
    argument :contract, Types::Contract::ContractInput, required: true,
             description: 'Contract object'

    field :contract, Types::Contract::ContractType, null: true
    field :errors, [String], null: false

    def resolve(args)
      form = ContractForm.new(args[:contract], id: args[:id])
      ContractServices::Update.(form: form)
    end
  end
end
