module Mutations::Contract
  class Delete < GraphQL::Schema::Mutation
    graphql_name 'DeleteContract'
    description 'Delete contract by ID'

    argument :id, ID, required: true

    field :errors, [String], null: false

    def resolve(id:)
      ContractServices::Delete.(id: id)
    end
  end
end
