# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    graphql_name 'Mutation'

    field :create_contract,
          mutation: ::Mutations::Contract::Create,
          description: 'Create a new contract'

    field :update_contract,
          mutation: ::Mutations::Contract::Update,
          description: 'Update the contract'

    field :delete_contract,
          mutation: ::Mutations::Contract::Delete,
          description: 'Delete the contract'
  end
end
