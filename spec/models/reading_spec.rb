require 'rails_helper'

RSpec.describe 'Thermostat requests',  :type => :request do
  describe 'Get /api/v1/thermostats' do
    it 'return a status message' do 
      get('/api/v1/thermostats')
      json = JSON.parse(response.body)
      expect(json["status"]).to eq('success')
    end
  end
end

RSpec.describe 'Thermostat Post request',  :type => :request do
  describe 'Get /api/v1/thermostats' do
    it 'return a status message' do 
      headers = { "ACCEPT" => "application/json" }
      puts location 		= Faker::Address.street_address
      puts household_token = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
      post "/api/v1/thermostats", :params => { :thermostat => {
        location: location,household_token: household_token}  }, :headers => headers
      json = JSON.parse(response.body)
      expect(json["status"]).to eq('success')
    end
  end
end

RSpec.describe 'Reading Post request',  :type => :request do
  it "creates a Reading" do
    thermostat = Thermostat.first #create!(household_token: household_token, location: location)
    puts thermostat
    expect('success').to eq('success')
    headers = { "ACCEPT" => "application/json", "token" => thermostat.household_token  }
    post "/api/v1/thermostats/#{thermostat.id}/readings", :params => { :reading => {
       number: rand(11.2...76.9),temperature: rand(11.2...76.9), humidity: rand(11.2...76.9),battery_charge: rand(11.2...76.9)
      } }, :headers => headers
    json = JSON.parse(response.body)
    expect(json["status"]).to eq('success')  
  end
end
