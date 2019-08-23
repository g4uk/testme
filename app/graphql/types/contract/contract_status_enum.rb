module Types::Contract
  class ContractStatusEnum < Types::BaseEnum
    graphql_name 'ContractStatus'
    description 'Statuses that a Contract can be in'

    value 'draft', description: 'Contract is not published'
    value 'signed', description: 'Contract is signed'
  end
end
