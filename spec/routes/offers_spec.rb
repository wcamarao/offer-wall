require_relative File.join('..', 'spec_helper')

describe OfferWall::Routes::Offers do
  describe 'GET /' do
    before do
      @params = { 'uid' => '42' }
      @stub = [{ 'offer' => 'stub' }]
      allow(OfferWall::Resources::Offer).to receive(:index).with(@params).and_return(@stub)
      get '/offers', @params
    end

    it 'returns 200 status code' do
      expect(last_response.status).to eq 200
    end

    it 'responds with offers.json' do
      expect(last_response.body).to eq JSON.unparse(@stub)
      expect(last_response.content_type).to eq 'application/json'
      expect(OfferWall::Resources::Offer).to have_received(:index).with(@params).once
    end
  end
end
