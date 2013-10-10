class Permission < ActiveRecord::Base
	has_many :permission_roles, :dependent => :destroy, :uniq => true
	has_many :roles, :through => :permission_roles
end
