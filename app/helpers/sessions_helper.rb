module SessionsHelper

  def signed_in?
    self.current_user.present?
  end

  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end

  def sign_out
    self.current_user = session[:user_id] = nil
  end

  def current_user
    @current_user ||= user_from_session
  end

  def current_user=( user )
    @current_user = user
  end

  private
  
  def user_from_session
    User.find_by_id(session[:user_id])
  end
end
