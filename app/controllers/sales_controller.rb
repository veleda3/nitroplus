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
    @sale.save(validate: false)

    unless params[:total_amount].to_i == 0
      if params[:payment_method] == "stripe"
        Stripe.api_key = Rails.application.secrets.stripe_secret_key
        amt = sprintf('%.2f', params[:total_amount])
        plan = "plan_#{amt}"
        card_token = Stripe::Token.create( :card => { :name => params[:card_name], :number => params[:card_number], :exp_month => params[:exp_month], :exp_year => params[:exp_year], :cvc => params[:card_cvv] })
        customer_params = {:card => card_token[:id], :plan => plan, :email => current_user.email}

        stripe_customer = Stripe::Customer.create(customer_params) 
        message = "Payment Successful"
        redirect_to root_url, notice: message
      end
    
      if params[:payment_method] == "paypal"
        values = {
          business: @user.email,
          cmd: '_xclick',
          upload: 1,
          notify_url: root_url,
          amount: params[:total_amount],
          quantity: '1',
          return: root_url
        }

        redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
      end
    end

  end

  def show
  end

  private

  def user_params
    # params[:first_name] = params[:first_name].join
    # params[:last_name] = params[:last_name].join
    # params[:email] = params[:email].join
    # params[:password] = params[:password].join
    params.permit(:first_name, :last_name, :email, :password)
  end

  def sales_params
    # params[:zip] = params[:zip].join
    # params[:address] = params[:address].join
    # params[:state] = params[:state].join
    # if params[:note]
    #   params[:note] = params[:note].join
    # end
    params.permit(:zip, :address, :state, :note, :amount, :service_id)
  end
end
