# frozen_string_literal: true

module Types
  class Iso8601DateType < Types::BaseScalar
    description 'An ISO 8601-encoded date'

    # @param value [Date]
    # @return [String]
    def self.coerce_result(value, _ctx)
      value.iso8601
    end

    # @param str_value [String]
    # @return [Date]
    def self.coerce_input(str_value, _ctx)
      Date.parse(str_value)
    rescue ArgumentError
      # Invalid input
      nil
    end
  end
end
