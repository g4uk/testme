class ContractForm
  include ActiveModel::Model

  attr_accessor :status, :name, :start_date, :avg_monthly_price

  validates :status, presence: true
  validates :status, inclusion: { in: Contract.statuses.keys }

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 255 }

  validates :start_date, presence: true
  validates :start_date, unless: -> { Date.parse(start_date).past? }

  validates :avg_monthly_price,
            numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  def create!
    return if invalid?

    Contract.create!(status: status,
                     name: name,
                     start_date: start_date,
                     avg_monthly_price: avg_monthly_price)
  end
end
