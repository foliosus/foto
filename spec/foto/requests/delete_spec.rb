require 'spec_helper'

describe Foto::Requests::Delete do
  let(:patient) { Foto::Patient.new }
  let(:url) { Foto::Requests::Delete.new(patient).send(:build_url).to_s }
  let(:body) do
    {
      a: 'a',
      b: 'b',
      c: 'c'
    }
  end
  let(:error) do
    %q{
    <html>
      <head>
        <title>Request Error - No API Key</title>
        <style type="text/css">
          body
          {
            font-family: Verdana;
            font-size: x-large;
          }
        </style>
      </head>
      <body>
        <h1>Request Error</h1>
        <p>A valid API key needs to be included using the Api-Key query string parameter</p>
      </body>
    </html>}
  end

  describe '#run' do
    describe 'On success' do
      it 'makes an HTTP Delete request to the correct URL' do
        stub_request(:delete, url)
        Foto::Requests::Delete.new(patient, body).run
        assert_requested(:delete, url)
      end
    end

    describe 'On error' do
      it 'returns an instance of Foto::Requests::Response' do
        stub_request(:delete, url).to_return(body: error, status: 401)
        response = Foto::Requests::Delete.new(patient, body).run
        assert_requested(:delete, url)
        expect(response.class).to equal(Foto::Requests::Response)
        expect(response.code).to eql('401')
        expect(response.hash['error']).to eql('A valid API key needs to be included using the Api-Key query string parameter')
      end
    end
  end

  describe '#url' do
    let(:api_key) { Foto::Config.api_key }
    let(:base_api_uri) { Foto::Config.base_api_uri }
    let(:uri) { Foto::Requests::Delete.new(patient).send(:build_url) }

    it 'returns a URI::HTTP' do
      expect(uri.class).to eql(URI::HTTP)
    end

    it 'has the correct url' do
      expect(uri.to_s).to eql("#{base_api_uri}/#{patient.class.url}/json/?Api-Key=#{api_key}")
    end
  end
end
