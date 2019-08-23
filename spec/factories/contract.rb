# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :contract do
    status { 'draft' }
    name { Faker::Name }
    start_date { Faker::Date.between(from: Date.today, to: 2.years.after) }
    avg_monthly_price { Faker::Number.decimal(2) }
  end
end
