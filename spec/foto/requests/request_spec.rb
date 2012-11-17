require 'spec_helper'

describe Foto::Requests::Request do
  let(:api_key) { Foto::Config.api_key }
  let(:base_uri) { Foto::Config.base_uri }
  let(:partial_url) { 'patient' }
  let(:url) { Foto::Requests::Request.build_uri('patient') }

  describe '.build_uri' do
    it 'returns a URI::HTTP' do
      url.class.should eql(URI::HTTP)
    end

    it 'has the correct url' do
      url.to_s.should eql("#{base_uri}/#{partial_url}/json/?Api-Key=#{api_key}")
    end
  end

  describe '.send_request' do
    let(:request) { Net::HTTP::Put.new(URI(base_uri).request_uri) }

    it 'sends a request' do
      stub_request(:put, base_uri)
      Foto::Requests::Request.send_request(request)
    end
  end
end
