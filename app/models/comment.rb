class Comment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post
  validates :body, presence: true
  validates :post_id, presence: true
  validates :author_id, presence: true
end
