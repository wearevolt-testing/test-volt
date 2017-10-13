require "application_responder"

module Api
  module V1
    class BaseController < ActionController::API
      before_action :doorkeeper_authorize!

      self.responder = ApplicationResponder
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
