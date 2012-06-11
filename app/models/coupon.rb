class Coupon < ActiveRecord::Base
  GROUPS = ["A","B","C","D"]
  ROUNDS = [1,2,3,4,5,6]
  
  GROUPS.each do |g|
    ROUNDS.each do |r|
      group = g.downcase
      attr_accessible "home_score_#{group}_#{r}"
      attr_accessible "away_score_#{group}_#{r}"
    end
  end

  (1..16).each do |i|
    attr_accessible "q_#{i}".to_sym
    attr_accessible "s_#{i}".to_sym
    attr_accessible "f_#{i}".to_sym
    attr_accessible "w_#{i}".to_sym
  end

  validate :everything

  belongs_to :user

  validates :user, :presence => true

  def score
    "TODO"
  end

  private

  def integer?(str)
    !!Integer(str) rescue false
  end

  def everything
    all_numbers = true
    GROUPS.each do |g|
      ROUNDS.each do |r|
        group = g.downcase
        h = send("home_score_#{group}_#{r}")
        a = send("away_score_#{group}_#{r}")
        all_numbers = all_numbers && integer?(h) && integer?(a) && (h.to_i >= 0) && (a.to_i >= 0)
      end
    end

    if !all_numbers
      errors.add(:base, "brug kun tal til resultaterne, det er klart bedst")
    end

    if [q_1, q_2, q_3, q_4].select { |e| e }.count != 2
      errors.add(:base, "nap 2 hold fra gruppe A")
    end
    if [q_5, q_6, q_7, q_8].select { |e| e }.count != 2
      errors.add(:base, "nap 2 hold fra gruppe B")
    end
    if [q_9, q_10, q_11, q_12].select { |e| e }.count != 2
      errors.add(:base, "nap 2 hold fra gruppe C")
    end
    if [q_13, q_14, q_15, q_16].select { |e| e }.count != 2
      errors.add(:base, "nap 2 hold fra gruppe D")
    end

    if [s_1, s_2, s_3, s_4, s_5, s_6, s_7, s_8].select { |e| e }.count != 2
      errors.add(:base, "nap 2 hold fra gruppe A og B")
    end

    if [s_9, s_10, s_11, s_12, s_13, s_14, s_15, s_16].select { |e| e }.count != 2
      errors.add(:base, "nap 2 hold fra gruppe C og D")
    end

    if [f_1, f_2, f_3, f_4, f_5, f_6, f_7, f_8, f_9, f_10, f_11, f_12, f_13, f_14, f_15, f_16].select { |e| e }.count != 2
      errors.add(:base, "nap 2 finalister")
    end

    if [w_1, w_2, w_3, w_4, w_5, w_6, w_7, w_8, w_9, w_10, w_11, w_12, w_13, w_14, w_15, w_16].select { |e| e }.count != 1
      errors.add(:base, "nap 1 vinder")
    end

  end

end
