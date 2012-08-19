class Admin::Organization < ActiveRecord::Base
	has_many :athletes
	attr_accessible :name
end
