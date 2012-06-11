class SessionsController < ApplicationController
  skip_before_filter :require_log_in
  
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
      flash[:error] = "Du kan ikke kom ind her i den mundering"
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    flash[:info] = "Du er ude igen"
    redirect_to root_path
  end  
end
