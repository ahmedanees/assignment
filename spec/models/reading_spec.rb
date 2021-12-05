require 'rails_helper'

RSpec.describe 'Reading Get request',  :type => :request do
  describe 'Get /api/v1/reading' do
    
    context 'with an unauthenticated user' do
      it 'returns unauthorized' do
        get "/api/v1/readings/123" 
        json = JSON.parse(response.body)
        expect(json["status"]).to eq('error')
      end
    end
    
    context 'with an authenticated reading get request' do
      let!(:thermostat) { Thermostat.create(household_token: (0...50).map { ('a'..'z').to_a[rand(26)] }.join, location: Faker::Address.street_address) }
      let!(:reading) { Reading.create!(thermostat_id: thermostat.id, number: rand(1...10),temperature: rand(11.2...76.9), humidity: rand(11.2...76.9),battery_charge: rand(11.2...76.9) ) }
      it 'renders json listing resource with id' do
        puts headers = { "token" => thermostat.household_token  }
        get "/api/v1/readings/#{reading.id}" , :params => { }, :headers => headers
        json = JSON.parse(response.body)
        expect(json["status"]).to eq('success')
      end
    end

    context 'with an authenticated reading post request' do
      let!(:thermostat) { Thermostat.create(household_token: (0...50).map { ('a'..'z').to_a[rand(26)] }.join, location: Faker::Address.street_address) }
      let!(:reading) { Reading.create!(thermostat_id: thermostat.id, number: rand(1...10),temperature: rand(11.2...76.9), humidity: rand(11.2...76.9),battery_charge: rand(11.2...76.9) ) }
      it 'renders json listing resource with id' do
        puts headers = { "token" => thermostat.household_token  }
        post "/api/v1/readings", :params => { :reading => {
          number: rand(11.2...76.9),temperature: rand(11.2...76.9), humidity: rand(11.2...76.9),battery_charge: rand(11.2...76.9)
          } }, :headers => headers
          json = JSON.parse(response.body)
        expect(json["status"]).to eq('success')
      end
    end
  end
end
