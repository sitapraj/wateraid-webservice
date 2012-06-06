class DistrictGirlSanitationCommunitySchool
  include Mongoid::Document
  
  field :Districts, type: String
  field :Total_No_of_Community_Schools, type: Integer
  field :Total_No_of_Schools_With_Toilet_Facilities, type: Integer
  field :Percentage_Of_Schools_With_Toilet_Facilities, type: Integer
  field :Total_No_Of_Toilet_Facilities_Inclusive_Of_Each_Toilet_Item, type: Integer
  field :Total_Number_Of_Toilets_For_Girl_Students_With_Items_Facilities, type: Integer
  field :Percentage_Of_Separate_Toilets_For_Girls_With_Items_Facilities, type: Integer
  field :Total_Students_Boys_And_Girls, type: Integer
  field :Toilet_To_Student_Ratio, type: String
  field :Percentage_Of_Schools_With_Separate_Toilets_For_Girls, type: Integer
  field :Districts_Ranked_By_Girl_Students_Access_To_School_Sanitation, type: Integer
  
end
