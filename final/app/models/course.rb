
class Course < ActiveRecord::Base
  has_many :enrolls
  has_many :users, :through => :enrolls
  has_many :announcements
  has_many :questions
end
