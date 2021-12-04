class ReadingJob < ActiveJob::Base
  queue_as :high_priority

	def perform(reading_params)

    puts "params #{reading_params}"
    Reading.create_record(reading_params)
	end
end
