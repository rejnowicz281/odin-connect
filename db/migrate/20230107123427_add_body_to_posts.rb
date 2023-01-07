class AddBodyToPosts < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.text :body
    end
  end
end
