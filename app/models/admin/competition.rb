class Admin::Competition < ActiveRecord::Base
  attr_accessible :max_age, :min_age, :name, :sex
end
