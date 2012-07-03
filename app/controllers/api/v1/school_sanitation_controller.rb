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
        respond_with DistrictGirlSanitationCommunitySchool.sum(:total_no_of_schools_with_toilet_facilities)
      end
      
      def percentage_of_schools_with_toilet_facilities
        respond_with DistrictGirlSanitationCommunitySchool.avg(:percentage_of_schools_with_toilet_facilities).to_i
      end
      
      def total_no_of_toilet_facilities_inclusive_of_each_toilet_item
        respond_with DistrictGirlSanitationCommunitySchool.sum(:total_no_of_toilet_facilities_inclusive_of_each_toilet_item)
      end
      
      def total_no_of_toilets_for_girl_students_with_items_facilities
        respond_with DistrictGirlSanitationCommunitySchool.sum(:total_no_of_toilets_for_girl_students_with_items_facilities)
      end
      
      def percentage_of_separate_toilets_for_girls_with_items_facilities
        respond_with DistrictGirlSanitationCommunitySchool.avg(:percentage_of_separate_toilets_for_girls_with_items_facilities).to_i
      end
      
      def percentage_of_schools_with_separate_toilets_for_girls
        respond_with DistrictGirlSanitationCommunitySchool.avg(:percentage_of_separate_toilets_for_girls_with_items_facilities).to_i
      end
      
      def total_students_boys_and_girls
        respond_with DistrictGirlSanitationCommunitySchool.sum(:total_students_boys_and_girls)
      end
      
      def percentage_of_schools_with_separate_toilets_for_girls
        respond_with DistrictGirlSanitationCommunitySchool.avg(:percentage_of_schools_with_separate_toilets_for_girls).to_i
      end
      
      def total_no_districts
        respond_with DistrictGirlSanitationCommunitySchool.count()
      end

		end
  end
end

