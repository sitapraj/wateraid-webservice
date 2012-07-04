WateraidWebservice::Application.routes.draw do
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'school_sanitation/index'
      get 'school_sanitation/search'
      get 'school_sanitation/total_number_of_community_school'
      get 'school_sanitation/total_no_of_schools_with_toilet_facilities'
      get 'school_sanitation/percentage_of_schools_with_toilet_facilities'
      get 'school_sanitation/total_no_of_toilet_facilities_inclusive_of_each_toilet_item'
      get 'school_sanitation/total_no_of_toilets_for_girl_students_with_items_facilities'
      get 'school_sanitation/percentage_of_separate_toilets_for_girls_with_items_facilities'
      get 'school_sanitation/percentage_of_schools_with_separate_toilets_for_girls'
      get 'school_sanitation/total_students_boys_and_girls'
      get 'school_sanitation/total_no_districts'
      get 'school_sanitation/percentage_of_schools_with_separate_toilets_for_girls'
			get 'school_sanitation/list_of_districts'
    end
  end
  
  get 'school_sanitation/export_to_csv'
  get 'school_sanitation/search'
  get 'school_sanitation/wateraid'
	get 'school_sanitation/wateraid_with_district'
  resources :school_sanitation
  
  root :to => 'school_sanitation#index'
end
