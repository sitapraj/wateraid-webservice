module Api
  module V1
    class Api::V1::SchoolSanitationController < ApplicationController
      respond_to :json
      
      def index
        respond_with DistrictGirlSanitationCommunitySchool.all
      end
      
      def search
        respond_with DistrictGirlSanitationCommunitySchool.where(:districts => params[:district].upcase).first
      end
      
      def total_number_of_community_school
        respond_with DistrictGirlSanitationCommunitySchool.sum(:total_no_of_community_schools).to_i
      end
      
      def total_no_of_schools_with_toilet_facilities
        respond_with DistrictGirlSanitationCommunitySchool.sum(:total_no_of_schools_with_toilet_facilities).to_i
      end
      
      def percentage_of_schools_with_toilet_facilities
        respond_with DistrictGirlSanitationCommunitySchool.avg(:percentage_of_schools_with_toilet_facilities).to_i
      end
      
      def total_no_of_toilet_facilities_inclusive_of_each_toilet_item
        respond_with DistrictGirlSanitationCommunitySchool.sum(:total_no_of_toilet_facilities_inclusive_of_each_toilet_item).to_i
      end
      
      def total_no_of_toilets_for_girl_students_with_items_facilities
        respond_with DistrictGirlSanitationCommunitySchool.sum(:total_no_of_toilets_for_girl_students_with_items_facilities).to_i
      end
      
      def percentage_of_separate_toilets_for_girls_with_items_facilities
        respond_with DistrictGirlSanitationCommunitySchool.avg(:percentage_of_separate_toilets_for_girls_with_items_facilities).to_i
      end
      
      def percentage_of_schools_with_separate_toilets_for_girls
        respond_with DistrictGirlSanitationCommunitySchool.avg(:percentage_of_separate_toilets_for_girls_with_items_facilities).to_i
      end
      
      def total_students_boys_and_girls
        respond_with DistrictGirlSanitationCommunitySchool.sum(:total_students_boys_and_girls).to_i
      end
      
      def percentage_of_schools_with_separate_toilets_for_girls
        respond_with DistrictGirlSanitationCommunitySchool.avg(:percentage_of_schools_with_separate_toilets_for_girls).to_i
      end
      
      def total_no_districts
        respond_with DistrictGirlSanitationCommunitySchool.count() - 1
      end

			def list_of_districts
				@districts = Array.new				
				DistrictGirlSanitationCommunitySchool.each do |sanitation|
  				@districts.push p sanitation.districts
				end
				respond_with @districts
			end

			def list_of_districts_all
				@districts = Array.new
				DistrictGirlSanitationCommunitySchool.each do |district|
					@districts.push p district.districts
				end
				respond_with @districts.slice(0..74)
			end
		end
  end
end

