class Profile < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates_presence_of :gender, :location, :phone_number, :birth_date
end
