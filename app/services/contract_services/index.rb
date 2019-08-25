# frozen_string_literal: true

module ContractServices
  class Index < BaseService
    # @return [ActiveRecord::Relation]
    def call
      offset = params[:offset] || 1
      ::Contract.paginate(offset)
    end
  end
end
