module Foto
  module Requests
    class Response
      attr_reader :body, :code

      def initialize(http_response)
        @body = http_response.body
        @code = http_response.code
      end

      def message
        doc = Nokogiri::HTML(@body)
        doc.xpath('/html/body/p').first.content
      end
    end
  end
end
