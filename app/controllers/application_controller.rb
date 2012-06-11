class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  helper_method :admin?
  
  before_filter :require_log_in

  def require_log_in
    if !signed_in?
      flash[:info] = "Kun den der logger godt og grundigt ind er velkommen"
      redirect_to root_path
    end
  end
end
