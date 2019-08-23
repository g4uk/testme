# frozen_string_literal: true

class Contract < ApplicationRecord
  enum status: { draft: 'draft', signed: 'signed' }
  cattr_accessor(:paginates_per) { 10 }

  def self.paginate(offset)
    offset(offset).limit(paginates_per)
  end
end
