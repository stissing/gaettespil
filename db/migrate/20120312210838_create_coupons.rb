class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :user_id

      t.boolean :winner

      Coupon::GROUPS.each do |group|
        Coupon::ROUNDS.each do |match|
          t.integer "home_score_#{group.downcase}_#{match}"
          t.integer "away_score_#{group.downcase}_#{match}"
        end
      end

      (1..16).each do |n|
        t.boolean "q_#{n}"
        t.boolean "s_#{n}"
        t.boolean "f_#{n}"
        t.boolean "w_#{n}"
      end

      t.integer :score, :default => 0
      # Coupon::GROUPS.each do |group|
      #   t.integer "#{group.downcase}_1"
      #   t.integer "#{group.downcase}_2"
      # end

      t.timestamps
    end
  end
end
