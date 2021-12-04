require 'rails_helper'

RSpec.describe 'Reading Get request',  :type => :request do
  describe 'Get /api/v1/reading' do
    it 'return a status message' do 
      thermostat = Thermostat.first
      reading = thermostat.readings.first
      headers = { "ACCEPT" => "application/json", "token" => thermostat.household_token  }
      get "api/v1/readings/#{reading.id}", :params => { :reading => {
        number: rand(11.2...76.9),temperature: rand(11.2...76.9), humidity: rand(11.2...76.9),battery_charge: rand(11.2...76.9)
       } }, :headers => headers
      json = JSON.parse(response.body)
      expect(json["status"]).to eq('success')
    end
  end
end

RSpec.describe 'Reading Post request',  :type => :request do
  it "creates a Reading" do
    thermostat = Thermostat.first
    headers = { "ACCEPT" => "application/json", "token" => thermostat.household_token  }
    post "/api/v1/readings", :params => { :reading => {
       number: rand(11.2...76.9),temperature: rand(11.2...76.9), humidity: rand(11.2...76.9),battery_charge: rand(11.2...76.9)
      } }, :headers => headers
    json = JSON.parse(response.body)
    expect(json["status"]).to eq('success')  
  end
end
