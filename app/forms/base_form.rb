# frozen_string_literal: true

class BaseForm
  include ActiveModel::Validations

  attr_reader :id, :input

  def initialize(input, id: nil)
    @input = input
    @id = id

    set_instance_variables
  end

  def set_instance_variables
    @input.each do |k, v|
      instance_variable_set(:"@#{k}", v)
    end
  end
end
