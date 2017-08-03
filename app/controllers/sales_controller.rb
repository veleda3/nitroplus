class SalesController < ApplicationController
  def create
    if !logged_in?
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        @user.save(validate: false)
        UserMailer.registration_confirmation(@user).deliver
      else
        errors = @user.errors.full_messages

        redirect_to "/services/#{params[:service_id]}", :flash => { error: errors }

      end

    end
    if errors.blank?
      @sale = @user.sales.new(sales_params)
      @sale.save

      unless params[:total_amount].to_i == 0
        if params[:payment_method] == "stripe"
          begin
            Sale.process_stripe_payment(params, current_user.email)
            redirect_to @user, :flash => { notice: "Payment Successful" }
          rescue Stripe::CardError => e
            redirect_to "/services/#{params[:service_id]}", :flash => { alert: e.message }
          end
        end

        if params[:payment_method] == "paypal"

          paypal_url = Sale.process_paypal_payment(params, current_user.email, "/users/#{current_user.id}")
          redirect_to paypal_url

        end
      end
    end
  end

  def show
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end

  def sales_params
    params.permit(:zip, :address, :state, :note, :amount, :service_id, :equipment_id)
  end
end
