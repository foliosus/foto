require 'foto/requests/request'

module Foto
  module Requests
    class PartnerAccessPost < Foto::Requests::Request

      private

      def build_url
        format = 'json'
        uri = "#{Foto::Config.base_api_uri}/partneraccess/#{format}/#{relative_url}/?Api-Key=#{api_key}"
        uri.sub!('/?', "/#{@uri_id}?") if @uri_id
        URI(uri)
      end

      def build_http_request
        request = Net::HTTP::Post.new(url.request_uri)
        request.body = body
        request
      end
    end
  end
end
