class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :invitee, null: false
      t.references :inviter, null: false

      t.timestamps
    end
  end
end
