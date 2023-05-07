class ApplicationController < ActionController::Base
    before_action :authenticate_user
    # protect_from_forgery with: :null_session
     def protect_against_forgery?
      false
    end
    private

    def authenticate_user
    token = request.headers['Authorization']
    fixed_token = "Bearer #{ENV['AUTHENTICATION_TOKEN']}" 
    unless token == fixed_token
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
    end


end
