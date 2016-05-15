class ApplicationMailer < ActionMailer::Base
  default from: 'Free Chapter Cape Town <fcctza@gmail.com>',
          reply_to: 'Michael Prins <michael.prins@me.com>'
  layout 'mailer'
end
