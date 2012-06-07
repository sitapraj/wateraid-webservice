WateraidWebservice::Application.routes.draw do
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :school_sanitation
    end
  end
  
  get 'school_sanitation/export_to_csv'
  get 'school_sanitation/search'
  resources :school_sanitation
  
  root :to => 'school_sanitation#index'
end
