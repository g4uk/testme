# frozen_string_literal: true

class TestMeSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
