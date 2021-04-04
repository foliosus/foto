require 'foto/requests/request'

module Foto
  module Requests
    class Delete < Foto::Requests::Request

      private

      def build_http_request
        request = Net::HTTP::Delete.new(url.request_uri)
        request.body = body
        request
      end
    end
  end
end
