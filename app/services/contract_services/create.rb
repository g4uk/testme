# frozen_string_literal: true

module ContractServices
  class Create < Base
    # @return [Hash]
    def call
      unless params[:form].valid?
        return result(errors: form_errors(params[:form]))
      end

      input = params[:form].input.to_h
      contract = ::Contract.create(input)
      result(contract: contract)
    end

    # @param form [BaseForm]
    # @return [Array]
    def form_errors(form)
      form.errors.full_messages
    end

    # @param contract [Contract]
    # @param errors [Array]
    # @return [Hash]
    def result(contract: nil, errors: [])
      { contract: contract, errors: errors }
    end
  end
end
