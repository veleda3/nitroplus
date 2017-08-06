class ApplicationMailer < ActionMailer::Base
  default from: ENV["GMAIL_ADDRESS"]
  # default :from => "noreply@nitroplus.com"
  layout 'mailer'
end
