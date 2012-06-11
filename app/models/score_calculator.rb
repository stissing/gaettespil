class ScoreCalculator
  def update_scores(correct)
    return unless correct

    ActiveRecord::Base.transaction do 
      Coupon.find_each do |coupon|
        update_score(coupon, correct)
      end
    end
  end
  
  private 
  
  def update_score(coupon, final)
    update_match_scores(coupon, final)
  end


  def update_match_scores(coupon, final)
    coupon.score = 0
    GROUPS.each do |g|
      ROUNDS.each do |r|
        group = g.downcase
        fh = final.send("home_score_#{group}_#{r}")
        fa = final.send("away_score_#{group}_#{r}")
        if(fh && fa)
          h = coupon.send("home_score_#{group}_#{r}")
          a = coupon.send("away_score_#{group}_#{r}")
          
          if(h>a && fh>fa)
            coupon.score += 5
          end
          if(h<a && fh<fa)
            coupon.score += 5
          end
          if(h==a && fh==fa)
            coupon.score += 5
          end

          if(h == fh && a == fa)
            coupon.score += 3
          end

          coupon.score -= abs(h-fh) + abs(a-fa)
        end
      end
    end
  end

  # def other(coupon)
  #   Match.all do |match|
  #     if(match.played?)
  #       match_guess = coupon.match_guesses.where(:match.eq(match)).first
  #       coupon.score += 5 * 1
  #     end
  #   end
  # end

end