require_relative File.join('..', 'spec_helper')

describe OfferWall::Resources::Offer do
  describe '#index' do
    it 'calls the offer api endpoint' do
      params = { 'uid' => 42 }
      stub = '[{ "offer": "stub" }]'
      url = OfferWall::Resources::Offer.build_index_url(params)

      allow(RestClient).to receive(:get).with(url).and_return(stub)
      result = OfferWall::Resources::Offer.index(params)

      expect(result).to eq JSON.parse(stub)
      expect(RestClient).to have_received(:get).with(url).once
    end
  end

  describe '#build_index_url' do
    it 'includes base params' do
      url = OfferWall::Resources::Offer.build_index_url({})
      OfferWall::Resources::Offer::BASE_PARAMS.each do |key, value|
        expect(url).to include "#{key}=#{value}"
      end
    end

    it 'includes given params' do
      url = OfferWall::Resources::Offer.build_index_url({ 'foo' => 'bar', 'x' => 42 })
      expect(url).to include "foo=bar"
      expect(url).to include "x=42"
    end

    it 'includes current timestamp' do
      Timecop.freeze do
        url = OfferWall::Resources::Offer.build_index_url({ 'foo' => 'bar' })
        expect(url).to include "timestamp=#{Time.now.to_i}"
      end
    end
  end

  describe '#build_sorted_string_params' do
    it 'sorts string params by keys' do
      string_params = OfferWall::Resources::Offer.build_sorted_string_params({ 'b' => 2, 'a' => 1 })
      expect(string_params).to eq 'a=1&b=2'
    end
  end

  describe '#build_hashkey' do
    it 'computes hashkey using sha1' do
      hashkey = OfferWall::Resources::Offer.build_hashkey('key=value', 'f00')
      expect(hashkey).to eq Digest::SHA1.hexdigest("key=value&f00")
    end
  end
end
