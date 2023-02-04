class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_one_attached :photo

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
