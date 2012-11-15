require 'spec_helper'

describe Foto::Client do
  describe '#initialize' do
    let(:default_options) do
      { :api_key => 'AAABBBCCC', :base_uri => 'http://a.b.com' }
    end
    let(:foto) { Foto::Client.new(default_options) }

    it 'can accept a default options hash' do
      foto.api_key.should eql(default_options[:api_key])
      foto.base_uri.should eql(default_options[:base_uri])
    end
  end
end


