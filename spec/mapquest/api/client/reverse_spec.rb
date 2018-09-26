RSpec.describe Mapquest::API::Client::Search do
  describe '#reverse', :vcr do
    subject(:client) { Mapquest::API::Client.new }

    describe 'when searching by OSM ID' do
      it 'returns data' do
        response = client.reverse(osm_type: 'W', osm_id: 5013364, format: 'jsonv2')

        expect(response['address']).to_not eq nil
        expect(response['lat']).to_not eq nil
        expect(response['lon']).to_not eq nil
        expect(response['osm_type']).to_not eq nil
        expect(response['osm_id']).to_not eq nil
      end

    end

    describe 'when searching by latlon' do
      it 'returns_data' do
        response = client.reverse(lat: "51.5217805", lon: "-0.162823959130876")

        expect(response['address']).to_not eq nil
        expect(response['lat']).to_not eq nil
        expect(response['lon']).to_not eq nil
        expect(response['osm_type']).to_not eq nil
        expect(response['osm_id']).to_not eq nil
      end
    end
  end
end
