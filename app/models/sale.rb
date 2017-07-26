class Sale < ApplicationRecord
  belongs_to :service
  belongs_to :equipment
  belongs_to :user
end
