# frozen_string_literal: true

class Contract < ApplicationRecord
  enum status: %i[draft signed]
end
