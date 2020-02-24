module Api
  module V2
    class ApiController < ::ApplicationController
      protect_from_forgery with: :null_session
      
      # require basic auth for v2 api
      include HttpAuthConcern
    end
  end
end