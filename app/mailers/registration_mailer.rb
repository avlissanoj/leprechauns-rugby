class RegistrationMailer < ApplicationMailer
  def send_age_registration_email(user)
    @user = user
    mail(to: @user.email, subject: "Atualize seu cadastro")
  end
end
