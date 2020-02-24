module Api
  module V1
    class FeedController < ApiController
      def index
        @products = Product.all
        
        render :json => @products, each_serializer: ProductSerializer
      end
    end
  end
end