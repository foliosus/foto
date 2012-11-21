require 'foto/requests/request'

module Foto
  module Requests
    class Put < Foto::Requests::Request

      private

      def url
        @url ||= self.class.build_url(relative_url)
      end

      def http_request
        @http_request ||= add_headers(build_request)
      end

      def build_request
        request = Net::HTTP::Put.new(url.request_uri)
        request.body = body
        request
      end
    end
  end
end
