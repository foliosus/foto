module Foto
  module Requests
    class Request

      private

      def self.send_request(request)
        base_uri = URI(Foto::Config.base_uri)
        http = Net::HTTP.new(base_uri.host, base_uri.port)
        http.start do |http|
          http.request(request)
        end
      end

      def self.build_uri(partial_url)
        format = 'json'
        URI("#{Foto::Config.base_uri}/#{partial_url}/#{format}/?Api-Key=#{Foto::Config.api_key}")
      end
    end
  end
end
