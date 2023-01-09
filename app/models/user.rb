class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy, foreign_key: :author_id

  has_many :invites, 
    class_name: "Invitation", 
    foreign_key: :inviter_id, 
    dependent: :destroy
  has_many :invitees, through: :invites

  has_many :invites_received, 
    class_name: "Invitation", 
    foreign_key: :invitee_id, 
    dependent: :destroy
  has_many :inviters, through: :invites_received

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end
end
