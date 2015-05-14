require_relative File.join('..', 'spec_helper')

describe OfferWall::Routes::Offers do
  describe 'GET /' do
    before do
      @stub = [{ 'offer' => 'stub' }]
      allow(OfferWall::Resources::Offer).to receive(:index).and_return(@stub)
      get '/offers'
    end

    it 'returns 200 status code' do
      expect(last_response.status).to eq 200
    end

    it 'responds with offers.json' do
      expect(last_response.body).to eq JSON.unparse(@stub)
      expect(last_response.content_type).to eq 'application/json'
      expect(OfferWall::Resources::Offer).to have_received(:index).once
    end
  end
end
