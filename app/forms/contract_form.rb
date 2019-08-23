# frozen_string_literal: true

class ContractForm < BaseForm
  attr_reader :status, :name, :start_date, :avg_monthly_price

  validates :status, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :start_date, presence: true

  validates :status, inclusion: { in: ::Contract.statuses.keys }

  validates :avg_monthly_price,
            numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  validate :verify_unique_name
  validate :verify_future_start_date

  def verify_unique_name
    return unless ::Contract.where(name: name).where.not(id: id).exists?

    errors.add :name, 'has already been taken'
  end

  def verify_future_start_date
    errors.add :start_date, 'in the past' if start_date.past?
  end
end
