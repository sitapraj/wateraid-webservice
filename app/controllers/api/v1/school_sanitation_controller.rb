module Api
  module V1
    class Api::V1::SchoolSanitationController < ApplicationController
      respond_to :json, :js
      
      def index
				@district = DistrictGirlSanitationCommunitySchool.collection.find.select(_id: 0).to_a

        respond_with(@district) do |format|
					format.json { render :json => @district }
					format.js { render :json => @district, :callback => params[:callback] }
				end
      end
      
      def search
				@district = DistrictGirlSanitationCommunitySchool.where(:districts => params[:district].upcase).first

				respond_with(@district) do |format|
					format.json { render :json => @district }
					format.js { render :json => @district, :callback => params[:callback] }
				end				
      end
      
      def total_number_of_community_school
				@total_school = DistrictGirlSanitationCommunitySchool.sum(:total_no_of_community_schools).to_i
				
				respond_with(@district_sanitation) do |format|
					format.json { render :json => @total_school }
					format.js { render :json => @total_school, :callback => params[:callback] }
				end 
      end
      
      def total_no_of_schools_with_toilet_facilities
				@school_toilet = DistrictGirlSanitationCommunitySchool.sum(:total_no_of_schools_with_toilet_facilities).to_i

				respond_with(@school_toilet) do |format|
					format.json { render :json => @school_toilet }
					format.js { render :json => @school_toilet, :callback => params[:callback] }
				end
      end
      
      def percentage_of_schools_with_toilet_facilities
				@percent_school = DistrictGirlSanitationCommunitySchool.avg(:percentage_of_schools_with_toilet_facilities).to_i
				
				respond_with(@percent_school) do |format|
					format.json { render :json => @percent_school }
					format.js { render :json => @percent_school, :callback => params[:callback] }
				end
      end
      
      def total_no_of_toilet_facilities_inclusive_of_each_toilet_item
        @total_no_toilet = DistrictGirlSanitationCommunitySchool.sum(:total_no_of_toilet_facilities_inclusive_of_each_toilet_item).to_i

				respond_with(@total_no_toilet) do |format|
					format.json { render :json => @total_no_toilet }
					format.js { render :json => @total_no_toilet, :callback => params[:callback] }
				end
      end
      
      def total_no_of_toilets_for_girl_students_with_items_facilities
        @total_toilets_girls = DistrictGirlSanitationCommunitySchool.sum(:total_no_of_toilets_for_girl_students_with_items_facilities).to_i

				respond_with(@total_toilets_girls) do |format|
					format.json { render :json => @total_toilets_girls }
					format.js { render :json => @total_toilets_girls, :callback => params[:callback] }
				end				
      end
      
      def percentage_of_separate_toilets_for_girls_with_items_facilities
        @avg_percent_toilets = DistrictGirlSanitationCommunitySchool.avg(:percentage_of_separate_toilets_for_girls_with_items_facilities).to_i

				respond_with(@avg_percent_toilets) do |format|
					format.json { render :json => @avg_percent_toilets }
					format.js { render :json => @avg_percent_toilets, :callback => params[:callback] }
				end
      end
      
      def percentage_of_schools_with_separate_toilets_for_girls
        @percent_separate_toilets_girls = DistrictGirlSanitationCommunitySchool.avg(:percentage_of_separate_toilets_for_girls_with_items_facilities).to_i

				respond_with(@percent_separate_toilets_girls) do |format|
					format.json { render :json => @percent_separate_toilets_girls }
					format.js { render :json => @percent_separate_toilets_girls, :callback => params[:callback] }
				end
      end
      
      def total_students_boys_and_girls
      	@total_student = DistrictGirlSanitationCommunitySchool.sum(:total_students_boys_and_girls).to_i

				respond_with(@total_student) do |format|
					format.json { render :json => @total_student }
					format.js { render :json => @total_student, :callback => params[:callback] }
				end
      end
      
      def percentage_of_schools_with_separate_toilets_for_girls
        @percent_school_girls = DistrictGirlSanitationCommunitySchool.avg(:percentage_of_schools_with_separate_toilets_for_girls).to_i

				respond_with(@percent_school_girls) do |format|
					format.json { render :json => @percent_school_girls }
					format.js { render :json => @percent_school_girls, :callback => params[:callback] }
				end
      end
      
      def total_no_districts
        @total_district = DistrictGirlSanitationCommunitySchool.count() - 1

				respond_with(@total_district) do |format|
					format.json { render :json => @total_district }
					format.js { render :json => @total_district, :callback => params[:callback] }				
				end
      end

			def list_of_districts
				@districts = Array.new				
				DistrictGirlSanitationCommunitySchool.each do |sanitation|
  				@districts.push p sanitation.districts
				end

				respond_with(@districts) do |format|
					format.json { render :json => @districts }
					format.js { render :json => @districts, :callback => params[:callback] }				
				end
			end

			def list_of_districts_all
				@districts = Array.new
				DistrictGirlSanitationCommunitySchool.each do |district|
					@districts.push p district.districts
				end

				respond_with(@districts) do |format|
					format.json { render :json => @districts.slice(0..74) }
					format.js { render :json => @districts.slice(0..74), :callback => params[:callback] }				
				end
			end

			def toilet_to_student_ratio
				@ratio = DistrictGirlSanitationCommunitySchool.where(:districts => params[:district].upcase).first.toilet_to_student_ratio

				@r = remove_colon(@ratio)				

				respond_with(@r) do |format|
					format.json { render :json => @r }
					format.js { render :json => @r, :callback => params[:callback] }
				end				
			end

			private
			def remove_colon(string)
				firstRatio = string[0]
				secondRatio = string.slice(2..string.length)
  			return firstRatio << secondRatio
			end		
		end
  end
end
