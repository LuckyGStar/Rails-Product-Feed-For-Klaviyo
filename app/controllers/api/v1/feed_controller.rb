module Api
  module V1
    class FeedController < ApiController
      def index
        @products = Product.all
        
        render :json => @products
      end
    end
  end
end