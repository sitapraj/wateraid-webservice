WateraidWebservice::Application.routes.draw do
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'school_sanitation/index'
      get 'school_sanitation/search'
    end
  end
  
  get 'school_sanitation/export_to_csv'
  get 'school_sanitation/search'
  resources :school_sanitation
  
  root :to => 'school_sanitation#index'
end
