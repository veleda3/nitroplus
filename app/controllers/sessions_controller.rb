class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      if user.email_confirmed
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash.now[:error] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
        render 'new'
      end
    else
      @errors = ["invalid Email or Password"]
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
