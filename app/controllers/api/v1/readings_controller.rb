module Api 
	module V1
		class ReadingsController < ApplicationController
			before_action :authenticate

			def index
				readings  = authentication_token.readings 
        render json: {status: 'success', message: 'Loaded reading', data: readings}, status: :ok
			end

			def show
			  reading  = Reading.find_by_id(params[:id])
		 	  	if reading.present?
		 		  render json: {status: 'success', message: 'Loaded reading', data: reading}, status: :ok
		 		else
		 			render json: {status: 'error', message: 'reading not fond'}, status: :unprocessable_entity
		 		end
			  
			end 

			def update
			  	reading  = Reading.find_by_id(params[:id])
				if reading.present? && reading.update_attributes(reading_params)
				render json: {status: 'success', message: 'reading updated'}, status: :ok
				else
					render json: {status: 'error', message: 'reading not updated', data: reading.errors}, status: :unprocessable_entity
				end  
			end 

			def create
				reading_id  = SecureRandom.uuid
        reading_params = {
            id: reading_id,
          	thermostat_id: authentication_token.id,
            number: params[:number],
            temperature: params[:temperature],
            humidity: params[:humidity],
            battery_charge: params[:battery_charge]
        }
				ReadingJob.perform_later(reading_params)
        render json: {status: 'success', message: 'Saved reading', reading_id: reading_id}, status: :ok
			end

			def destroy
			  reading  = Reading.find_by_id(params[:id])
				if reading.destroy
				render json: {status: 'success', message: 'Deleted reading'}, status: :ok
				else
					render json: {status: 'error', message: 'reading not deleted', data: reading.errors}, status: :unprocessable_entity
				end  
			end 

			protected
			
			def authenticate
				authentication_token || render_unauthorized
			end
			
			def authentication_token
				authenticate_with_http_token do |token, options|
					Thermostat.find_by_household_token(token)
				end	
			end
			
			def render_unauthorized
				render json: {status: 'error', message: 'Bad request'}, status: 401
			end

			private
			def reading_params
			  params.require(:reading).permit(:thermostat_id,:number, :temperature,:humidity,:battery_charge)
			end  
		end
	end
end