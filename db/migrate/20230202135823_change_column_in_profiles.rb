class ChangeColumnInProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :phone_number
    add_column :profiles, :phone_number, :integer
  end
end
