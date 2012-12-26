module Foto
  module Requests
    class Response
      attr_reader :body, :code

      class InvalidResponse < StandardError; end

      def initialize(http_response)
        @body = http_response.body
        @code = http_response.code
      end

      def message
        doc = Nokogiri::HTML(body)
        doc.xpath('/html/body/p').first.content
      rescue Exception => e
        raise InvalidResponse, "The response from FOTO could not be parsed.\nHTTP #{code} : #{body}"
      end

      def successful?
        code == '200'
      end
    end
  end
end
