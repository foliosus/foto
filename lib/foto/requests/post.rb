require 'foto/requests/request'

module Foto
  module Requests
    class Post < Foto::Requests::Request

      private

      def build_http_request
        request = Net::HTTP::Post.new(url.request_uri)
        request.body = body
        request
      end
    end
  end
end
