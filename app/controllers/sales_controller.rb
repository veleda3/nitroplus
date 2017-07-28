class SalesController < ApplicationController
  def create
    if !logged_in?
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        # UserMailer.welcome_email(@user).deliver!
      else
        @errors = @user.errors.full_messages
        render :template => "services/show"
      end
    end

    
  end

  def show
  end

  private

  def user_params
    params.permit(:first_name[0], :last_name[0], :email[0], :password[0])
  end

  def sales_params
    params.permit(:zip_code[0], :address[0], :state[0], :note[0], :service_price, :payment_method)
  end
end
