WateraidWebservice::Application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :school_sanitation
    end
  end

  # root :to => 'api_v1_school_sanitation#index'
end
