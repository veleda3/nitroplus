class UserMailer < ActionMailer::Base
#   default :from => ENV["GMAIL_ADDRESS"]
default :from => "noreply@nitroplus.com"


def registration_confirmation(user)
   @user = user
   mail to: user.email, subject: "Registration Confirmation for NitroPlus"
 end
end
