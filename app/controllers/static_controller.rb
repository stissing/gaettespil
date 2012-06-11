class StaticController < ApplicationController
  skip_before_filter :require_log_in
  before_filter :require_admin, :only => :update_scores

  def front
  end

  def rules
  end

  def update_scores
    ScoreCalculator.new.update_scores(admin.coupon)
    flash[:info] = "Scoren er opdateret for alt og alle"
    redirect_to root_path
  end

  def require_admin
    if !admin?
      flash[:info] = "Kun for mig"
      redirect_to root_path
    end
  end
end
  
