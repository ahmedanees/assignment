class Reading < ApplicationRecord
	validates :number, presence: true
	validates :temperature, presence: true
	validates :humidity, presence: true
	validates :battery_charge, presence: true
	
	belongs_to :thermostat

	def self.create_record(params)
			Reading.create!(params)
	end
end
