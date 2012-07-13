class SchoolSanitationController < ApplicationController
  
	layout 'school_sanitation'
 
	def district_school_sanitation
		@districts = DistrictGirlSanitationCommunitySchool.all
		@district = Array.new
		@districts.each do |d|
			@district.push d.to_str
		end

    respond_to do |format|
      format.html 
      format.xml { render :xml => @district.slice(0..74) }
      format.json { render :json => @district.slice(0..74) }
    end	
	end
	
	def export_to_csv
    @districts = DistrictGirlSanitationCommunitySchool.all.to_a.slice(0..74)
    
    csv_string = CSV.generate do |csv|
      # header row
      csv << ["districts", 
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
        csv << [district.districts, 
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
      :disposition => "attachment; filename=district_school_sanitation.csv"
  end

  def wateraid
    render :wateraid
  end

	def wateraid_with_district
		if params[:district].nil?
			redirect_to school_sanitation_wateraid_path
		else 
			@district = DistrictGirlSanitationCommunitySchool.where(:districts => params[:district].upcase).first
			if(@district.nil? || @district == "" || params[:district] == "OVERALL")
				redirect_to school_sanitation_wateraid_path
			else		
				render :wateraid_with_district
			end
		end
	end

end
