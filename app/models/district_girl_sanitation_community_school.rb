class DistrictGirlSanitationCommunitySchool
  include Mongoid::Document

	#field :districts, :type => String
  field :districts, type: String
  field :total_no_of_community_schools, type: Integer
  field :total_no_of_schools_with_toilet_facilities, type: Integer
  field :percentage_of_schools_with_toilet_facilities, type: Integer
  field :total_no_of_toilet_facilities_inclusive_of_each_toilet_item, type: Integer
  field :total_no_of_toilets_for_girl_students_with_items_facilities, type: Integer
  field :percentage_of_separate_toilets_for_girls_with_items_facilities, type: Integer
  field :total_students_boys_and_girls, type: Integer
  field :toilet_to_student_ratio, type: String
  field :percentage_of_schools_with_separate_toilets_for_girls, type: Integer
  field :districts_ranked_by_girl_students_access_to_school_sanitation, type: Integer

	def to_str
    val = self.attributes.symbolize_keys
    val.delete(:_id)
    val.delete(:created_at)
    val.delete(:updated_at)
    return val.stringify_keys
  end
end
