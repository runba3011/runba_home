# Preview all emails at http://localhost:3000/rails/mailers/request_email_mailer
class RequestEmailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_email_mailer/send_mail
  def send_mail
    RequestEmailMailer.send_mail
  end

end
