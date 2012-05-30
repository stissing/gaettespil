class SessionsController < ApplicationController
  def create
    session = params[:session]
    email = session[:email]
    password = session[:password]
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      sign_in( user )
      flash[:success] = "Du er inde"
      redirect_to user
    else
      flash[:error] = "Hvad er det du leder efter?"
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    flash[:info] = "Du er ude igen"
    redirect_to root_path
  end  
end
