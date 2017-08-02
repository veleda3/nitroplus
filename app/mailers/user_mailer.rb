class UserMailer < ActionMailer::Base
  default :from => "application_name@domain.com"

def registration_confirmation(user)
   @user = user
   mail(:to => "#{user.full_name} <#{user.email}>", :subject => "Registration Confirmation for NitroPlus")
 end
end
