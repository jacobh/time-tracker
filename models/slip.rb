class Slip < ActiveRecord::Base
  attr_accessible :duration, :note

  belongs_to :project
  belongs_to :user
end