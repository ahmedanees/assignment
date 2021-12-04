
10.times do
	location 		= Faker::Address.street_address
	household_token = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
	thermostat = Thermostat.create!(household_token: household_token, location: location)
	5.times do
		thermostat.readings.create!(thermostat_id: thermostat.id, number: rand(1...10),temperature: rand(11.2...76.9), humidity: rand(11.2...76.9),battery_charge: rand(11.2...76.9) )
	end	
end

