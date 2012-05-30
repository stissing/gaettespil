class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :user_id
      t.integer :match_guess_a1_id
      t.integer :country_guess_a1_id

      t.timestamps
    end
  end
end
