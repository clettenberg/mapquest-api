require_relative 'client/search'
require_relative 'client/reverse'

module Mapquest
  module API
    class Client
      include Mapquest::API::Client::Search
      include Mapquest::API::Client::Reverse
    end
  end
end
