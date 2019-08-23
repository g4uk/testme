# frozen_string_literal: true

module ContractServices
  class Delete < Base
    # @return [Contract]
    def call
      ::Contract.destroy(params[:id])
    end
  end
end
