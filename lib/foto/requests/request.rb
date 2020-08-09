module Foto
  module Requests
    class Request
      attr_accessor :relative_url, :body, :consumer

      def initialize(consumer, body = {})
        @consumer = consumer
        @relative_url = consumer.class.url
        @body = body
      end

      def run
        send_http_request
      end

      def url
        @url ||= build_url
      end

      private

      def build_http_request
        raise NotImplementedError.new('You must implement build_request')
      end

      def http_request
        @http_request ||= add_headers(build_http_request)
      end

      def protocol
        url.scheme
      end

      def content_length
        body.length
      end

      def content_type
        'text/json'
      end

      def api_key
        consumer.api_key || Foto::Config.api_key
      end

      def use_ssl?
        protocol === 'https'
      end

      def add_headers(http_request)
        http_request.add_field('User-Agent', 'Foto')
        http_request.add_field('Content-Length', content_length)
        http_request.add_field('Content-Type', content_type)
        http_request
      end

      def send_http_request
        base_uri = URI(Foto::Config.base_api_uri)
        http = Net::HTTP.new(base_uri.host, base_uri.port)
        if use_ssl?
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          http.use_ssl = true
        end
        http.start do |http|
          Response.new(http.request(http_request))
        end
      end

      def build_url
        format = 'json'
        URI("#{Foto::Config.base_api_uri}/#{relative_url}/#{format}/?Api-Key=#{api_key}")
      end
    end
  end
end
