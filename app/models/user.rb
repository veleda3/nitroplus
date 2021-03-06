class User < ApplicationRecord
has_many :questions
has_many :sales
has_many :posts
has_many :comments, through: :post, foreign_key: "comment_id"
has_many :services, through: :sales, foreign_key: "service_id"
has_many :equipments, through: :sales, foreign_key: "equipment_id"
validates_format_of :email, :with => /@/
before_create :confirmation_token
mount_uploader :picture, PictureUploader

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

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
       self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
