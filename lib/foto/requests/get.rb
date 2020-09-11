require 'foto/requests/request'

module Foto
  module Requests
    class Get < Foto::Requests::Request

      private

      def build_http_request
        request = Net::HTTP::Get.new(url.request_uri)
        request
      end
    end
  end
end
