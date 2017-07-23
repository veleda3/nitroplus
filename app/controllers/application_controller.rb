class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def unauthorized
    unless logged_in?
      @errors = ["You need to be logged in to enter."]
      render 'users/login'
    end
  end
  
end
