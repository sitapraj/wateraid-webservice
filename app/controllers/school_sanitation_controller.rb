class SchoolSanitationController < ApplicationController
  
  def index
    @districts = DistrictGirlSanitationCommunitySchool.all
    respond_to do
      format.html
      format.xml { render :xml => @districts }
      format.json { render :json => @districts }
    end
  end
  
end
