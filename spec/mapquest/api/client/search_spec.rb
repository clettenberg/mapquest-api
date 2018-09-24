RSpec.describe Mapquest::API::Client::Search do
  describe '#search', :vcr do
    subject(:client) { Mapquest::API::Client.new }
    let(:q) { 'Tower Grove Park' }
    it 'returns data' do
      response = client.search(q: q, format: 'jsonv2', addressdetails: '1')

      expect(response.is_a?(Array)).to eq true
      expect(response[0]['address']).to_not eq nil
      expect(response[0]['lat']).to_not eq nil
      expect(response[0]['lon']).to_not eq nil
    end

    describe 'when given an argument hash with different key types' do
      it 'returns data' do
        response = client.search({
          "format" => "jsonv2",
          "accept-language" => "en-US,en;q=0.9",
          "addressdetails" => "1",
          "polygon_geojson" => "1",
          "namedetails" => "1",
          q: "New York",
          addressdetails: 1 })

        expect(response.is_a?(Array)).to eq true
        expect(response[0]['address']).to_not eq nil
        expect(response[0]['lat']).to_not eq nil
        expect(response[0]['lon']).to_not eq nil
      end
    end

    describe 'for bad request' do
      let!(:api_key) { ENV["MAPQUEST_API_KEY"] }
      before do
        ENV["MAPQUEST_API_KEY"] = 'foo'
      end
      after do
        ENV["MAPQUEST_API_KEY"] = api_key
      end

      describe 'for bad API key' do
        it 'returns hash with error message' do
          # Unset key to get a bad response from API
          api_key = ENV["MAPQUEST_API_KEY"]
          ENV["MAPQUEST_API_KEY"] = 'foo'

          expect(client.search(format: 'json')).to eq(errors: 'The AppKey submitted with this request is invalid.')
        end
      end
    end

    describe 'when format is XML' do
      it "returns a string" do
        response = client.search(q: q, format: 'xml', addressdetails: '1')

        expect(response.is_a?(String)).to eq true
      end
    end

    describe 'when format is HTML' do
      it "returns a string" do
        response = client.search(q: q, format: 'html', addressdetails: '1')

        expect(response.is_a?(String)).to eq true
      end
    end
  end
end
