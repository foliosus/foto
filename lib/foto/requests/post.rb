module Foto
  module Requests
    class Post
      def initialize(url, params = {})
        Net::HTTP.post(url, params)
      end
    end
  end
end
