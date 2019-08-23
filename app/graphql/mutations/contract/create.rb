module Mutations::Contract
  class Create < GraphQL::Schema::Mutation
    graphql_name 'CreateContract'
    description 'Create a new contract'

    null false

    argument :contract, Types::Contract::ContractInput, required: true,
             description: 'Contract object'

    field :contract, Types::Contract::ContractType, null: true
    field :errors, [String], null: false

    def resolve(args)
      ContractServices::Create.(form: ContractForm.new(args[:contract]))
    end
  end
end
