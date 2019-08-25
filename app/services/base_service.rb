# frozen_string_literal: true

class BaseService
  attr_reader :params

  include Callable

  # @param params [Hash]
  def initialize(params)
    @params = params
  end

  def call
    raise 'Method `call` must be implemented'
  end
end
