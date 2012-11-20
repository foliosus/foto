require 'foto/requests/request'

module Foto
  module Requests
    class Put < Foto::Requests::Request
      attr_accessor :relative_url, :body

      def initialize(relative_url, body = '')
        @relative_url = relative_url
        @body = body
        self.class.send_request(http_request)
      end

      private

      def url
        @url ||= self.class.build_url(relative_url)
      end

      def http_request
        @http_request ||= build_request
      end

      def build_request
        request = Net::HTTP::Put.new(url.request_uri)
        request.body = body
        request
      end
    end
  end
end
