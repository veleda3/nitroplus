class User < ApplicationRecord
has_many :questions
has_many :sales
has_many :services, through: :sales, foreign_key: "service_id"
has_many :equipments, through: :sales, foreign_key: "equipment_id"

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
