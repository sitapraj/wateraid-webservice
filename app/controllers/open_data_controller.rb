require 'csv'

class OpenDataController < ApplicationController	

	layout 'open_data'

	def index		
	end

	def infographics
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

	def apps
	end
	
	def datasets
	end

end
