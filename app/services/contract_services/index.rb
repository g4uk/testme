# frozen_string_literal: true

module ContractServices
  class Index < Base
    # @return [ActiveRecord::Relation]
    def call
      offset = params[:offset] || 1
      ::Contract.paginate(offset)
    end
  end
end
