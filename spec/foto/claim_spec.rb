require 'spec_helper'

describe Foto::Claim do
  let(:claim) { Foto::Claim.new }
  let(:initialized_claim) { Foto::Claim.new(claim_attributes) }
  let(:claim_attributes) do
    {
      episode_id:          '2042',
      external_episode_id: '37',
    }
  end

  it 'should have accessors for each attribute' do
    Foto::Claim.attributes.each do |attribute|
      expect(claim).to respond_to(attribute)
    end
  end

  it 'accepts an initial hash of attributes' do
    claim_attributes.each do |k, v|
      expect(v).to be_truthy
      expect(initialized_claim.send(k)).to eql(v)
    end
  end

  it 'has a uri_id' do
    expect(initialized_claim.uri_id).to eql('claim2')
  end

  describe '#as_json' do
    it 'returns a JSON hash of attributes' do
      expected = {
        'episodeId'         => initialized_claim.episode_id,
        'externalEpisodeId' => initialized_claim.external_episode_id,
      }
      expect(Yajl::Parser.parse(initialized_claim.as_json)).to eq(expected)
    end
  end

  describe '#save' do
    let(:request) { double :request }
    it 'makes a request to FOTO' do
      expect(Foto::Requests::Put).to receive(:new).and_return(request)
      expect(request).to receive(:run)
      initialized_claim.save
    end
  end

  describe '.url' do
    it 'returns a partial URL' do
      expect(claim.class.url).to be_truthy
      expect(claim.class.url).to be_an_instance_of(String)
    end
  end
end
