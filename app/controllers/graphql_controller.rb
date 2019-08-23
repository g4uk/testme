# frozen_string_literal: true

class GraphqlController < ApplicationController
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {}

    render json: result(query, variables, context, operation_name)
  rescue => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  def result(query, variables, context, operation_name)
    TestMeSchema.execute(query,
                         variables: variables,
                         context: context,
                         operation_name: operation_name)
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      handle_string(ambiguous_param)
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_string(ambiguous_param)
    if ambiguous_param.present?
      ensure_hash(JSON.parse(ambiguous_param))
    else
      {}
    end
  end

  def handle_error_in_development(exception)
    logger.error exception.message
    logger.error exception.backtrace.join("\n")

    render json: {
      error: { message: exception.message, backtrace: exception.backtrace },
      data:  {}
    }, status: 500
  end
end
