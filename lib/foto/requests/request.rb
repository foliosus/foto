module Foto
  module Requests
    class Request
      attr_accessor :relative_url, :body

      def initialize(relative_url, body = {})
        @relative_url = relative_url
        @body = body
      end

      def run
        self.class.send_request(http_request)
      end

      private

      def content_length
        body.length
      end

      def content_type
        'text/json'
      end

      def add_headers(http_request)
        http_request.add_field('User-Agent', 'Foto')
        http_request.add_field('Content-Length', content_length)
        http_request.add_field('Content-Type', content_type)
        http_request
      end

      def self.send_request(request)
        base_uri = URI(Foto::Config.base_uri)
        http = Net::HTTP.new(base_uri.host, base_uri.port)
        http.start do |http|
          return http.request(request)
        end
      end

      def self.build_url(partial_url)
        format = 'json'
        URI("#{Foto::Config.base_uri}/#{partial_url}/#{format}/?Api-Key=#{Foto::Config.api_key}")
      end
    end
  end
end
