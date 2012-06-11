# coding: utf-8
class CouponsController < ApplicationController
  before_filter :require_tournament_not_started

  def create
    @coupon = Coupon.new(params[:coupon])
    @coupon.user = current_user

    if( @coupon.save )
      flash[:success] = "Sikke en laber kupon, skal du i grupperne og kigge videre"
      redirect_to current_user
    else
      flash[:error] = "Der er lidt halløj med kuponen. Prøv at ret det lidt til og gæt igen."
      @user = current_user
      render 'users/show'
    end
  end

  def update
    @coupon = current_user.coupon
    if(@coupon.update_attributes(params[:coupon]))
      flash[:success] = "Nåda, man var ikke helt tilfreds. Godt du fik gættet igen."
      redirect_to current_user
    else
      flash[:error] = "Der er lidt halløj med kuponen. Prøv at ret det lidt til og gæt igen."
      @user = current_user
      render 'users/show'
    end
  end

  def require_tournament_not_started
    return
    return if current_user == admin

    if !admin.coupon.home_score_a_1.nil?
      flash[:info] = "Turneringen er i fuld gang, så gætteriet er sat lidt i bero"
      redirect_to user_path( current_user )
    end
  end
end
