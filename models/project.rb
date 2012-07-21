class Project < ActiveRecord::Base
  attr_accessible :name, :description

  validates :name, presence: true, length: { in: 1..50 }
end