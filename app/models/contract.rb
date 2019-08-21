class Contract < ApplicationRecord
  enum status: %i[draft signed]
end
