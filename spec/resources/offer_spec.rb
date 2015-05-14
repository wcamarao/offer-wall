require_relative File.join('..', 'spec_helper')
require_relative File.join('..', '..', 'app/resources/offer')

describe OfferWall::Resources::Offer do
  describe '#index' do
    it 'calls the offer api endpoint' do
      stub = '[{ "offer": "stub" }]'
      url = OfferWall::Resources::Offer::INDEX_ENDPOINT

      allow(RestClient).to receive(:get).with(url).and_return(stub)
      result = OfferWall::Resources::Offer.index

      expect(result).to eq JSON.parse(stub)
      expect(RestClient).to have_received(:get).with(url).once
    end
  end
end
