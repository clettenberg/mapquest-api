require 'addressable/uri'
require 'faraday'

module Mapquest
  module API
    class Client
      module Search
        MAPQUEST_NOMINATIM_ROOT_URL = "https://open.mapquestapi.com/nominatim/v1"

        def search(args = {})
          uri = Addressable::URI.parse("#{MAPQUEST_NOMINATIM_ROOT_URL}/search.php")
          uri.query_values = args.merge({ key: ENV['MAPQUEST_API_KEY'] })

          response = Faraday.get(uri)
          if response.success?
            %w(json jsonv2).include?(args[:format]) ? JSON.parse(response.body) : response.body
          else
            { errors: response.body }
          end
        end

      end
    end
  end
end
