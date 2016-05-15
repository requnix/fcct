class ApplicationMailer < ActionMailer::Base
  default from: "Free Chapter Cape Town <mailgun@#{ENV['MAILGUN_DOMAIN'] || 'localhost'}>",
          reply_to: 'Michael Prins <michael.prins@me.com>'
  layout 'mailer'
end
