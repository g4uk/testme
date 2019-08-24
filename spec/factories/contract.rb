# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :contract do
    status { 'draft' }
    sequence :name do |n|
      "#{Faker::Name}#{n}"
    end
    start_date { Faker::Date.between(from: Date.today, to: 2.years.after).to_s }
    avg_monthly_price { Faker::Number.decimal }
  end
end
