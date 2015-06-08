
class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  has_many :enrolls
  has_many :courses, :through => :enrolls

  validates :email, :uniqueness => true, :allow_nil => false
  validates :password, :presence => true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  has_secure_password

end
