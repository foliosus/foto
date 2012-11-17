require 'foto/requests/request'

module Foto
  module Requests
    class Put < Foto::Requests::Request

      def initialize(relative_url, body = '')
        url = self.class.build_uri(relative_url)
        self.class.send_request(build_request(url, body))
      end

      def build_request(url, body)
        request = Net::HTTP::Put.new(url.request_uri)
        request.body = body
        request
      end
    end
  end
end
