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

      def build_url
        format = 'json'
        URI("#{Foto::Config.base_api_uri}/partneraccess/#{format}/#{relative_url}/?Api-Key=#{api_key}")
      end
    end
  end
end
