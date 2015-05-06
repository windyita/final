
class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  has_many :enrolls
  has_many :courses
end
