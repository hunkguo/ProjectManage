class UserDept < ActiveRecord::Base
	belongs_to :user
	belongs_to :dept
end
