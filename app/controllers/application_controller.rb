class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_unprocessable_entity_response(exception)
    render json: ErrorSerializer.active_record_error(exception.message, "400"), status: :bad_request
  end

  def render_not_found_response(exception)
  render json: ErrorSerializer.active_record_error("Record not found", "404"), status: :not_found
  end
end
