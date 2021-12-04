Rails.application.routes.draw do
 namespace 'api' do 
 	namespace 'v1' do
 		# resources :thermostats  do
		# 	# collection do
		# 	# 	# get :set_tier
		# 	# 	post :
		# 	# end
		# 	resources :readings
			
		# end
		resources :readings  
 	end
 end
end
