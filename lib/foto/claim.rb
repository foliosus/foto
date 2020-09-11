module Foto
  class Claim < Foto::Consumer
    ATTRIBUTES = [
      :episode_id,
      :external_episode_id,
    ]

    attr_accessor *ATTRIBUTES

    class << self
      def attributes
        ATTRIBUTES
      end

      def url
        'episode'
      end
    end

    def uri_id
      'claim2'
    end

    def as_json
      Yajl::Encoder.encode({
        'episodeId'         => episode_id,
        'externalEpisodeId' => external_episode_id,
      })
    end
  end
end
