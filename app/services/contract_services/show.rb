# frozen_string_literal: true

module ContractServices
  class Show < BaseService
    # @return [Contract]
    def call
      ::Contract.find(params[:id])
    end
  end
end
