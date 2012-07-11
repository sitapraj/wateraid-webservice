class OpenDataController < ApplicationController
	
	layout 'open-data'
	
	def index
		@districts = DistrictGirlSanitationCommunitySchool.all.to_a.slice(0..74)

    respond_to do |format|
      format.html 
      format.xml { render :xml => @districts }
      format.json { render :json =>  @districts }      
    end
	end
end
