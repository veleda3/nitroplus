class User < ApplicationRecord
  
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  before_save :to_downcase

  has_secure_password

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end

  def to_downcase
    email.downcase!
  end

end
