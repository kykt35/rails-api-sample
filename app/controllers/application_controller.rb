class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from Exception, with: :handle_500 unless Rails.env.development?
	rescue_from ActionController::RoutingError, with: :handle_404 unless Rails.env.development?
  rescue_from ActionController::BadRequest, with: :handle_400 unless Rails.env.development?
  
  def handle_500(exception = nil)
		logging_error(exception) if exception
		render json: { error: 'Internal Server error' }, status: 500
	end

	def handle_404(exception = nil)
		logging_error(exception) if exception
		render json: { error: 'Not Found error' }, status: 404
  end
  
	def handle_400(exception = nil)
		logging_error(exception) if exception
		render json: { error: 'Bad Request' }, status: 400
	end
end
