Rails.application.routes.draw do
 namespace 'api' do 
 	namespace 'v1' do
 		resources :readings  
 	end
 end
end
