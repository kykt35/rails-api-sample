module Api
  module V1
    class PostsController < ApplicationController
      before_action :authenticate_api_v1_user!
      def index
        render json: { status: 'SUCCESS', message: 'posts#index'}
      end
    end
  end
end
