require 'spec_helper'

describe Foto::Requests::Response do
  context "a failed request" do
    let(:http_response) do
      double :http_response, body: html, code: '401'
    end
    let(:html) do
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
    let!(:response) { Foto::Requests::Response.new(http_response) }

    it 'provides its response code' do
      expect(response.code).to eql('401')
    end

    it 'provides its raw body' do
      expect(response.body).to eql(html)
    end

    it 'provides a hash' do
      expected = {'error' => 'A valid API key needs to be included using the Api-Key query string parameter'}
      expect(response.hash).to eq(expected)
    end

    it 'knows it is not successful' do
      expect(response).to_not be_successful
    end

    it 'knows it is not ok' do
      expect(response).to_not be_ok
    end
  end

  context "a successful request" do
    let(:http_response) do
      double :http_response, body: html, code: '200'
    end
    let(:html) { '{"MessageID":1624488,"OrganizationID":1260,"PatientExternalID":"00001","Success":true,"Text":null}' }
    let!(:response) { Foto::Requests::Response.new(http_response) }

    it 'provides its response code' do
      expect(response.code).to eql('200')
    end

    it 'provides its raw body' do
      expect(response.body).to eql(html)
    end

    it 'provides a hash' do
      expected = {
        'MessageID' => 1624488,
        'OrganizationID' => 1260,
        'PatientExternalID' => '00001',
        'Success' => true,
        'Text' => nil
      }
      expect(response.hash).to eq(expected)
    end

    it 'knows it is successful' do
      expect(response).to be_successful
    end

    it 'knows it is ok' do
      expect(response).to be_ok
    end
  end
end
