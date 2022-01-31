class ApplicationMailer < ActionMailer::Base
  default from: "localhost:3000"
  layout 'mailer'
end
