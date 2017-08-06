class UserMailer < ActionMailer::Base
  default :from => "application_name@domain.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Registration Confirmation for Awesome App")
    # mail(:to => "#{user.name} <#{user.email}", :subject => "Registration Confirmation for Awesome App")
  end

end
