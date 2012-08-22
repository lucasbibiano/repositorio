class Admin::Organization < ActiveRecord::Base
	has_many :athletes, :class_name=>"Representante::Athlete"
	has_many :users, :class_name=>"User"

	attr_accessible :name
end
