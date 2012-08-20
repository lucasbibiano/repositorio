class Admin::Competition < ActiveRecord::Base
	has_and_belongs_to_many :athletes
	attr_accessible :max_age, :min_age, :name, :sex, :max_per_org
end
