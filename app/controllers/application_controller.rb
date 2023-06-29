class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_not_found_response(error)
    render json: ErrorSerializer.new(error).serialized_json, status: 404
  end
end
