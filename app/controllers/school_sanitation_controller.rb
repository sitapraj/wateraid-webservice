require 'csv'

class SchoolSanitationController < ApplicationController
  
  def index
    @districts = DistrictGirlSanitationCommunitySchool.all
    
    respond_to do |format|
      format.html 
      format.xml { render :xml => @districts }
      format.json { render :json =>  @districts }      
    end
  end
    
  def export_to_csv
    @districts = DistrictGirlSanitationCommunitySchool.all
    
    csv_string = CSV.generate do |csv|
      # header row
      csv << ["_id",
        "districts", 
        "total_no_of_community_schools", 
        "total_no_of_schools_with_toilet_facilities",
        "percentage_of_schools_with_toilet_facilities",
        "total_no_of_toilet_facilities_inclusive_of_each_toilet_item",
        "total_no_of_toilets_for_girl_students_with_items_facilities",
        "percentage_of_separate_toilets_for_girls_with_items_facilities",
        "total_students_boys_and_girls",
        "toilet_to_student_ratio",
        "percentage_of_schools_with_separate_toilets_for_girls",
        "districts_ranked_by_girl_students_access_to_school_sanitation"]

      # data rows
      @districts.each do |district|
        csv << [district._id,
          district.districts, 
          district.total_no_of_community_schools, 
          district.total_no_of_schools_with_toilet_facilities,
          district.percentage_of_schools_with_toilet_facilities,
          district.total_no_of_toilet_facilities_inclusive_of_each_toilet_item,
          district.total_no_of_toilets_for_girl_students_with_items_facilities,
          district.percentage_of_separate_toilets_for_girls_with_items_facilities,
          district.total_students_boys_and_girls,
          district.toilet_to_student_ratio,
          district.percentage_of_schools_with_separate_toilets_for_girls,
          district.districts_ranked_by_girl_students_access_to_school_sanitation]
      end
    end

    # send it to the browsah
    send_data csv_string, 
      :type => 'text/csv; charset=iso-8859-1; header=present', 
      :disposition => "attachment; filename=districts.csv"
  end
  
  def wateraid
    render :wateraid
  end
  
end
