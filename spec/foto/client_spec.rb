require 'spec_helper'

describe Foto::Client do
  describe '#initialize' do
    let(:default_options) do
      { api_key: 'AAABBBCCC', base_uri: 'http://a.b.com' }
    end
    let(:foto) { Foto::Client.new(default_options) }

    it 'can accept a default options hash' do
      expect(foto.api_key).to eql(default_options[:api_key])
      expect(foto.base_uri).to eql(default_options[:base_uri])
    end
  end
end


