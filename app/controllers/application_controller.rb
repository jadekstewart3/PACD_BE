class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def render_not_found_response(error)
    render json: ErrorSerializer.new(error).serialized_json, status: 404
  end

  def render_unprocessable_entity_response(error)
    render json: ErrorSerializer.new(error).serialized_json, status: 400
  end
end
