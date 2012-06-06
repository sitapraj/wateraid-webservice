module Api
  module V1
    class Api::V1::SchoolSanitationController < ApplicationController
      respond_to :json
      
      def index
        respond_with DistrictGirlSanitationCommunitySchool.all
      end
      
      def show
        respond_with DistrictGirlSanitationCommunitySchool.find(params[:id])
      end
      
      def create
        respond_with DistrictGirlSanitationCommunitySchool.create(params[:districtgirlsanitationcommunityschool])
      end
      
      def update
        respond_with DistrictGirlSanitationCommunitySchool.update(params[:id], params[:districtgirlsanitationcommunityschool])
      end
      
      def destory
        respond_with DistrictGirlSanitationCommunitySchool.destroy(params[:id])
      end
    end
  end
end