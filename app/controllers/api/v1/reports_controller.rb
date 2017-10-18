module Api
  module V1
    class ReportsController < BaseController

      def by_author
        command = CreateReportService.new(:by_author, self).call
        status = command.success ? :ok : :bad_request
        render json: command.message, status: status
      end
    end
  end
end
