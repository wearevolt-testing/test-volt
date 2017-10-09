module Api
  module V1
    class BaseController < ApplicationController
      skip_before_action :authenticate_user!
      before_action :doorkeeper_authorize!

      respond_to :json

      protected

      def current_resource_owner
        if doorkeeper_token
          @current_resource_owner ||= User.find(doorkeeper_token.resource_owner_id)
        end
      end
    end
  end
end
