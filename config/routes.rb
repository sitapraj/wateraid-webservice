WateraidWebservice::Application.routes.draw do
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :school_sanitation
    end
  end
  
  resources :school_sanitation
  root :to => 'school_sanitation#index'
end
