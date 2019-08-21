# frozen_string_literal: true

class ContractForm
  include ActiveModel::Model

  attr_accessor :status, :name, :start_date, :avg_monthly_price

  validates :status, presence: true
  validates :status, inclusion: { in: Contract.statuses.keys }

  validates :name, presence: true
  validate :verify_unique_name
  validates :name, length: { maximum: 255 }

  validates :start_date, presence: true
  validate :verify_future_start_date

  validates :avg_monthly_price,
            numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  def create!
    return if invalid?

    Contract.create!(status: status,
                     name: name,
                     start_date: start_date,
                     avg_monthly_price: avg_monthly_price)
  end

  def verify_unique_name
    return unless Contract.exists?(name: name)

    errors.add :name, 'has already been taken'
  end

  def verify_future_start_date
    return unless Date.parse(start_date).past?

    errors.add :start_date, 'in the past'
  end
end
