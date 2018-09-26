require 'addressable/uri'
require 'faraday'

module Mapquest
  module API
    class Client
      module Reverse
        MAPQUEST_NOMINATIM_ROOT_URL = "https://open.mapquestapi.com/nominatim/v1"

        def reverse(args = {})
          search_parameters = args.transform_keys(&:to_s).merge({ "key" => ENV['MAPQUEST_API_KEY'] })

          uri = Addressable::URI.parse("#{MAPQUEST_NOMINATIM_ROOT_URL}/reverse.php")
          uri.query_values = search_parameters

          response = Faraday.get(uri)
          if response.success?
            %w(json jsonv2).include?(search_parameters["format"]) ? JSON.parse(response.body) : response.body
          else
            { errors: response.body }
          end
        end

      end
    end
  end
end
