require 'spec_helper'

describe Foto::Requests::Response do
  let(:http_response) do
    mock :http_response, :body => html, :code => '401'
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

  describe '#initialize' do
    it 'sets the appropriate instance variables' do
      response.body.should eql(html)
      response.code.should eql('401')
    end
  end

  describe '#message' do
    it 'returns the correct response message' do
      response.message.should eql('A valid API key needs to be included using the Api-Key query string parameter')
    end
  end

  describe 'successful?' do
    it 'returns true if the request was successful' do
      response.should_not be_successful
    end
  end
end
