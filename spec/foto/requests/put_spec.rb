require 'spec_helper'

describe Foto::Requests::Put do
  let(:partial_url) { 'patient' }
  let(:url) { Foto::Requests::Request.build_uri(partial_url).to_s }

  describe '#initialize' do
    it 'makes a HTTP Put request to the correct URL' do
      stub_request(:put, url)
      Foto::Requests::Put.new(partial_url)
    end
  end
end
