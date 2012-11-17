require 'spec_helper'

describe Foto::Requests::Put do
  let(:partial_url) { 'patient' }
  let(:url) { Foto::Requests::Request.build_uri(partial_url).to_s }

  it 'makes a PUT request on initialize' do
    stub_request(:put, url)
    Foto::Requests::Put.new('patient')
  end
end
