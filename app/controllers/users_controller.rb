class UsersController < ApplicationController

  def create
    user = User.new(params[:user])
    if user.save
      
      #todo sign in
      redirect_to user
    else
      flash[:error] = "Kunne ikke oprette bruger"
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    @coupon = @user.coupon || @user.build_coupon
  end

end
