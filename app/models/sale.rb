class Sale < ApplicationRecord
  belongs_to :service
  belongs_to :equipment
  belongs_to :user

  def self.process_stripe_payment(params, email)
    Stripe.api_key = Rails.application.secrets.stripe_secret_key
    amt = sprintf('%.2f', params[:total_amount])
    plan = "plan_#{amt}"
    card_token = Stripe::Token.create( :card => {
    	:name => params[:card_name],
    	:number => params[:card_number],
    	:exp_month => params[:exp_month],
    	:exp_year => params[:exp_year],
    	:cvc => params[:card_cvv] })

    customer_params = {:card => card_token[:id], :plan => plan, :email => email}

    stripe_customer = Stripe::Customer.create(customer_params)
    return true
  end

  def self.process_paypal_payment(params,email, return_path)
  	values = {
      business: email,
      cmd: '_xclick',
      upload: 1,
      notify_url: return_path,
      amount: params[:total_amount],
      quantity: '1',
      item_name: "Nitroplus",
      return: return_path
    }

    return "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
