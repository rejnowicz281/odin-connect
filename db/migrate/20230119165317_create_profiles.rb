class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :phone_number
      t.string :gender
      t.date :birth_date
      t.string :location
      t.references :user

      t.timestamps
    end
  end
end
