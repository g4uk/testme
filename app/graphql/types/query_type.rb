module Types
  class QueryType < Types::BaseObject
    field :contract, Contract::ContractType, null: true do
      argument :id, ID, required: true
      description 'fetch a Contract by id'
    end

    def contract(id:)
      ::ContractServices::Show.(id: id)
    end

    field :contracts, [Contract::ContractType], null: true do
      argument :offset, Integer, required: false, default_value: 0
      description 'fetch all contracts with pagination'
    end

    def contracts(offset:)
      ::ContractServices::Index.(offset: offset)
    end
  end
end
