class Thermostat < ApplicationRecord
	validates :household_token, presence: true
	has_many   :readings, :dependent => :destroy
end
