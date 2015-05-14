require_relative File.join('..', 'spec_helper')

describe OfferWall::Routes::Index do
  describe 'GET /' do
    before :all do
      get '/'
    end

    it 'returns 200 status code' do
      expect(last_response.status).to eq 200
    end

    it 'responds with index.html' do
      body = File.read File.join(app.root, 'assets/index.html')
      expect(last_response.content_type).to start_with 'text/html'
      expect(last_response.body).to eq body
    end
  end
end
