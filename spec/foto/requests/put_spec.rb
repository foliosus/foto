require 'spec_helper'

describe Foto::Requests::Put do
  let(:partial_url) { 'patient' }
  let(:url) { Foto::Requests::Request.build_url(partial_url).to_s }
  let(:body) do
    {
      :a => 'a',
      :b => 'b',
      :c => 'c'
    }
  end

  describe '#run' do
    it 'makes an HTTP Put request to the correct URL' do
      stub_request(:put, url)
      Foto::Requests::Put.new(partial_url, body).run
      assert_requested(:put, url)
    end
  end
end
