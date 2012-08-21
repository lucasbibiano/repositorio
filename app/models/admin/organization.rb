class Admin::Organization < ActiveRecord::Base
	has_many :athletes, :class_name=>"Representante::Athlete"
	attr_accessible :name
end
