class User < ActiveRecord::Base
    attr_accessible :email, :name, :password
    has_secure_password
    has_many :slips
    has_and_belongs_to_many :projects
    validates :email, uniqueness: true
end