class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def render_unprocessable_entity_response(exception)
    render json: ErrorSerializer.record_invalid(exception), status: :bad_request
  end
end
