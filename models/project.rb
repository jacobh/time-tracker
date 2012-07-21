class Project < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :slips
  has_and_belongs_to_many :users
  validates :name, presence: true, length: { in: 1..50 }
end