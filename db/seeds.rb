# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Membership.delete_all
Group.delete_all
Coupon.delete_all
User.delete_all

100.times do |t|
  puts t
  
  user = User.create!(name: "User#{t}", email: "user#{t}@test.dk", password: "Abcd1234")
  coupon = Coupon.new
  Coupon::GROUPS.each_with_index do |group, index|
    Coupon::ROUNDS.each do |match|
      coupon.send("home_score_#{group.downcase}_#{match}=", rand(5))
      coupon.send("away_score_#{group.downcase}_#{match}=", rand(5))      
    end
  end
  coupon.send("q_1=", true)
  coupon.send("q_2=", true)
  coupon.send("q_5=", true)
  coupon.send("q_6=", true)
  coupon.send("q_9=", true)
  coupon.send("q_10=", true)
  coupon.send("q_13=", true)
  coupon.send("q_14=", true)

  coupon.send("s_1=", true)
  coupon.send("s_2=", true)
  coupon.send("s_9=", true)
  coupon.send("s_10=", true)

  coupon.send("f_1=", true)
  coupon.send("f_2=", true)

  coupon.send("w_1=", true)
  
  coupon.user = user
  coupon.save!
end

10.times do |t|
  group = Group.create!(name: "group #{t}", password: "group #{t}")
  10.times do |n|
    u = User.find_by_name "User#{rand(100)}"
    u.groups << group
  end
end

User.create!(name: "Malle", email: "martinstissing@gmail.com", password: "Abcd1234")

