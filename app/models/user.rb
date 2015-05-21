
class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  has_many :enrolls
  has_many :courses, :through => :enrolls

  validates :email, :uniqueness => true, :allow_nil => false
  validates :passwd, :presence => true
end
