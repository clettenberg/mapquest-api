require_relative 'client/search'

module Mapquest
  module API
    class Client
      include Mapquest::API::Client::Search
    end
  end
end
