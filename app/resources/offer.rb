require 'digest/sha1'

module OfferWall
  module Resources
    class Offer
      API_KEY = ENV['API_KEY']

      OFFER_ENDPOINT = ENV['OFFER_ENDPOINT']

      BASE_PARAMS = {
        'appid' => 157,
        'device_id' => '2b6f0cc904d137be2e1730235f5664094b83',
        'ip' => '109.235.143.113',
        'locale' => 'de',
        'ps_time' => 1312211903
      }

      def self.index(params)
        response = RestClient.get(build_index_url(params))
        JSON.parse(response)
      end

      def self.build_index_url(params)
        base_params = BASE_PARAMS.merge(params)
        timestamped_params = base_params.merge({ 'timestamp' => Time.now.to_i })
        string_params = build_sorted_string_params(timestamped_params)
        hashkey = build_hashkey(string_params, API_KEY)
        "#{OFFER_ENDPOINT}?#{string_params}&hashkey=#{hashkey}"
      end

      def self.build_sorted_string_params(params)
        sorted_pairs = params.keys.sort.map { |k| "#{k}=#{params[k]}" }
        sorted_pairs.join('&')
      end

      def self.build_hashkey(string_params, api_key)
        Digest::SHA1.hexdigest("#{string_params}&#{api_key}")
      end
    end
  end
end
