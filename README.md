Test
================

Ruby on Rails
-------------

This application requires:

- Ruby 2.4.0
- Rails 5.2.0

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

Documentation and Support
-------------------------


Technical test
================

Ruby on Rails
-------------

This application requires:

- Ruby 2.4.0
- Rails 5.2.0

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

Documentation and Support
-------------------------
http://[DOMAIN]/api/v1/thermostats

Authorization:
Bearer
token: e.g "42f22705-9916-4cdc-a080-af7b4074f1bb"

{
    "status": "success",
    "message": "Loaded thermostat",
    "data": [
        {
          ...

        }
}        
GET http://[DOMAIN]/api/v1/readings/[reader_id]
Authorization:
Bearer
token: e.g "42f22705-9916-4cdc-a080-af7b4074f1bb"

{
    "status": "success",
    "message": "Loaded reading",
    "data": {
        "id": "66756b43-b2e1-48a4-a155-95be8301fd86",
        "thermostat_id": "42f22705-9916-4cdc-a080-af7b4074f1bb",
        "number": 21,
        "temperature": "42.05",
        "humidity": "18.46",
        "battery_charge": "13.91",
        "created_at": "2021-12-04T14:36:42.890Z",
        "updated_at": "2021-12-04T14:36:42.890Z"
    }
}

POST http://[DOMAIN]/api/v1/thermostats/[THERMOSTAT_ID]/readings
Authorization:
Bearer
token: e.g "42f22705-9916-4cdc-a080-af7b4074f1bb"
{
    "number": 21,
    "temperature": "42.05",
    "humidity": "18.46",
    "battery_charge": "13.91",
}

Before_action :authenticate is used to authenticate household_token for each call


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