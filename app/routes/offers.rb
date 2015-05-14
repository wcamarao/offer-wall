require_relative File.join('..', 'resources/offer')

module OfferWall
  module Routes
    module Offers

      def self.registered(app)
        app.get '/offers' do
          json OfferWall::Resources::Offer.index
        end
      end

    end
  end
end
