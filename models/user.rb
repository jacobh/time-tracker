require "digest"

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  has_secure_password
  has_many :slips
  has_and_belongs_to_many :projects
  validates :email, uniqueness: true

  def gravatar_url(size)
    hex = Digest::MD5.new.hexdigest email.downcase
    "http://www.gravatar.com/avatar/#{hex}?=#{size}"
  end
end