class Invitation < ApplicationRecord
  belongs_to :invitee, class_name: "User"
  belongs_to :inviter, class_name: "User"

  validate :not_friends
  validate :not_pending
  validate :not_self

  def accept
    inviter.friends << invitee
    destroy
  end

  def reject
    destroy
  end

  private

  def not_self
    errors.add(:invitee, "can't be equal to inviter") if inviter == invitee
  end

  def not_friends
    errors.add(:invitee, 'is already added') if inviter.friends.include?(invitee)
  end

  def not_pending
    errors.add(:invitee, 'already requested friendship') if invitee.invitees.include?(inviter)
  end
end
