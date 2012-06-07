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
    end
  end
end