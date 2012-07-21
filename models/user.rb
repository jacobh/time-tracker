class User < ActiveRecord::Base
    attr_accessible :email, :name
    has_secure_password
    has_many :slips
    has_and_belongs_to_many :projects
end