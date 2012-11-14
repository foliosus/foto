require 'spec_helper'
require 'config'

describe Foto::Config do
  let(:config)   { Foto::Config }
  let(:defaults) { Foto::Config::Defaults }

  before do
    config.reset!
  end

  describe '.api_key' do
    it 'should have a default' do
      config.api_key.should eql(defaults::API_KEY)
    end
  end

  describe '.patients_url' do
    it 'should have a default' do
      config.patients_uri.should eql(defaults::PATIENTS_URI)
    end
  end

  describe '.reset!' do
    it 'resets the configuration to their default values' do
      config.api_key = 'somethingelse'
      config.api_key.should eql('somethingelse')
      config.patients_uri = 'http://other.com'
      config.patients_uri.should eql('http://other.com')
      config.reset!
      config.api_key.should eql(defaults::API_KEY)
      config.patients_uri.should eql(defaults::PATIENTS_URI)
    end
  end

  describe '.options' do
    it 'returns a hash of current options' do
      config.options.keys.should =~ Foto::Config::VALID_OPTIONS
    end
  end

  describe '.configure' do
    Foto::Config::VALID_OPTIONS.each do |option|
      it "#{option} should be configurable" do
        Foto::Config.configure do |config|
          config.send("#{option}=", option)
          config.send(option).should eql(option)
        end
      end
    end
  end
end
