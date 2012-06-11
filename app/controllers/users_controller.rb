# coding: utf-8
class UsersController < ApplicationController
  skip_before_filter :require_log_in, :only => :create

  def create
    user = User.new(params[:user])

    if user.save
      sign_in( user )
      flash[:info] = "Så er det bare at gætte løs. Husk også at gruppere ved lejlighed"
      redirect_to user
    else
      flash[:error] = "Kunne ikke sådan oprette en sådan bruger til dig. Hvad katten er problemet"
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    @coupon = @user.coupon || Coupon.new
  end

end
