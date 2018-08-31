class ApplicationMailer < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid

  default from: 'leprechauns-rugby@gmail.com'
end
