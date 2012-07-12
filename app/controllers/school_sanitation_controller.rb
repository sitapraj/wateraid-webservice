class SchoolSanitationController < ApplicationController
  
	layout 'school_sanitation'
  
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
