class User < ActiveRecord::Base
	has_many :user_depts, :dependent => :destroy, :uniq => true
	has_many :depts, :through => :user_depts

	has_many :user_roles, :dependent => :destroy, :uniq => true
	has_many :roles, :through => :user_roles

	accepts_nested_attributes_for :depts




	validates :username, presence: true
	validates :username, uniqueness: true
	validates :password, presence: true, on: :save
	validates :password, length: { in: 1..20 }, on: :save
	validates :password, confirmation: true, on: :save
    validates :password_confirmation, presence: true, on: :save
end
