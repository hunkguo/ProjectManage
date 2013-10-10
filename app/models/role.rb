class Role < ActiveRecord::Base
	has_many :user_roles, :dependent => :destroy, :uniq => true
	has_many :users, :through => :user_roles


	has_many :permission_roles, :dependent => :destroy, :uniq => true
	has_many :permissions, :through => :permission_roles
end
