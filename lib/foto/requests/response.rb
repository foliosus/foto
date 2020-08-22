module Foto
  module Requests
    class Response
      attr_reader :body, :code, :hash

      class InvalidResponse < StandardError; end

      def initialize(http_response)
        @body = http_response.body
        @code = http_response.code
        parse_json
      end

      def successful?
        if hash.keys.include?('Success')
          ok? && hash['Success']
        else
          ok?
        end
      end

      def ok?
        code == '200'
      end

      def error?
        !ok?
      end

      private def parse_json
        @hash = Hash.new{|hash, key| key.is_a?(Symbol) && hash[key.to_s] ? hash[key.to_s] : nil }
        if ok?
          if !body.empty?
            parsed_body = JSON.parse(body)
            if parsed_body.is_a?(String)
              @hash.merge!({ 'value' => parsed_body })
            else
              @hash.merge!(JSON.parse(body))
            end
          end
        else
          response_string = Nokogiri::HTML(body).xpath('/html/body/p').first.content
          @hash.merge!({ 'error' => response_string })
        end
      rescue NoMethodError => e
        raise InvalidResponse, "The response from FOTO could not be parsed. HTTP #{code}: #{body}"
      end
    end
  end
end
