require 'spec_helper'

describe Foto::Config do
  let(:config)   { Foto::Config }
  let(:defaults) { Foto::Config::Defaults }

  before do
    config.reset!
  end

  describe '.api_key' do
    it 'has a default' do
      expect(config.api_key).to eql(defaults::API_KEY)
    end
  end

  describe '.base_uri' do
    it 'has a default' do
      expect(config.base_uri).to eql(defaults::BASE_URI)
    end
  end

  describe '.reset!' do
    it 'resets the configuration to their default values' do
      config.api_key = 'somethingelse'
      expect(config.api_key).to eql('somethingelse')
      config.base_uri = 'http://other.com'
      expect(config.base_uri).to eql('http://other.com')
      config.reset!
      expect(config.api_key).to eql(defaults::API_KEY)
      expect(config.base_uri).to eql(defaults::BASE_URI)
    end
  end

  describe '.options' do
    it 'returns a hash of current options' do
      expect(config.options.keys).to match(Foto::Config::VALID_OPTIONS)
    end
  end
end

describe Foto do
  describe '.configure' do
    Foto::Config::VALID_OPTIONS.each do |option|
      it "#{option} should be configurable" do
        Foto.configure do |configuration|
          configuration.send("#{option}=", option)
          expect(configuration.send(option)).to eql(option)
        end
      end
    end
  end
end
