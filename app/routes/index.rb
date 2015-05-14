module OfferWall
  module Routes
    module Index

      def self.registered(app)
        app.get '/' do
          send_file File.join(app.root, '/assets/index.html')
        end
      end

    end
  end
end
