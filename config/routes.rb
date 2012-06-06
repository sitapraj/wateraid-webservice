WateraidWebservice::Application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :school_sanitation
    end
  end
  
  resources :school_sanitation
  root :to => 'school_sanitation#index'
end
