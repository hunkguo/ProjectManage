class Dept < ActiveRecord::Base
	has_many :user_depts,:dependent => :destroy, :uniq => true
	has_many :users, :through => :user_depts
end
