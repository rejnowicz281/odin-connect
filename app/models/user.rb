class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  require 'open-uri'

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_one :profile

  has_many :posts, dependent: :destroy, foreign_key: :author_id

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy, foreign_key: :author_id

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
    self.friends.destroy(friend)
  end

  def profile_picture_path
    if self.profile == nil || self.profile.photo_attachment == nil
      "default-picture.jpg"
    else
      self.profile.photo
    end
  end

  def self.from_omniauth(auth)
    user = find_by(provider: auth.provider, uid: auth.uid)
    if user.nil?
      user = new(email: auth.info.email, password: Devise.friendly_token[0, 20], provider: auth.provider, uid: auth.uid)
      user.skip_confirmation!
      user.save!

      user.create_profile
      photo = URI.open(auth.info.image)
      user.profile.photo.attach(io: photo, filename: auth.info.image)
    end
    user
  end
end
