class RequestEmailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_email_mailer.send_mail.subject
  #
  def send_mail(content)
    @content = content
    mail to: "runba3011@gmail.com" , subject: "Ruba's Homeからのリクエスト"
  end
end
