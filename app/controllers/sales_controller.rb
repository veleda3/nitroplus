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

    @sale = @user.sales.new(sales_params)
    

  end

  def show
  end

  private

  def user_params
    params[:first_name] = params[:first_name].join
    params[:last_name] = params[:last_name].join
    params[:email] = params[:email].join
    params[:password] = params[:password].join
    params.permit(:first_name, :last_name, :email, :password)
  end

  def sales_params
    params[:zip] = params[:zip].join
    params[:address] = params[:address].join
    params[:state] = params[:state].join
    if params[:note]
      params[:note] = params[:note].join
    end
    params.permit(:zip, :address, :state, :note, :amount, :service_id)
  end
end
