module OfferWall
  module Resources
    class Offer
      INDEX_ENDPOINT = 'http://api.sponsorpay.com/feed/v1/offers.json'

      def self.index
        response = RestClient.get(INDEX_ENDPOINT)
        JSON.parse(response)
      end
    end
  end
end
