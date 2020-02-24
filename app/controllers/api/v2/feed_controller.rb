module Api
  module V2
    class FeedController < ApiController
      def index
        @products = Product.all
        
        render :json => @products
      end
    end
  end
end