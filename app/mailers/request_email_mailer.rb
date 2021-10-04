class RequestEmailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_email_mailer.send_mail.subject
  #
  def send_mail(content , user)
    @content = content
    @user = user
    mail( to: "runba3011@gmail.com" , subject: "Ruba's Homeから来たリクエスト")
  end
end
