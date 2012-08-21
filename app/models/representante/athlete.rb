class Representante::Athlete < ActiveRecord::Base
	belongs_to :organization, :class_name=>"Admin::Organization"
	has_and_belongs_to_many :competitions, :class_name=>"Admin::Competition",
	 :join_table => 'athletes_competitions'
	attr_accessible :age, :name, :sex
end
