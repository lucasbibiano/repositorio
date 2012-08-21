class Admin::Competition < ActiveRecord::Base
	has_and_belongs_to_many :athletes, :class_name=>"Representante::Athlete",
	 :join_table => 'athletes_competitions'
	attr_accessible :max_age, :min_age, :name, :sex, :max_per_org

	def full_name
		return "" << name.to_s << " (" << min_age.to_s << " a " <<
		  max_age.to_s << " anos) " << " - " << sex.to_s
	end
end
