class PendencyMailer < ApplicationMailer
  def send_new_pendency_email(user)
    @user = user
    mail(to: @user.email, subject: "Mensalidade atrasada")
  end

  def send_multiple_pendencies_email(user)
    @user = user
    mail(to: @user.email, subject: "Atenção às suas mensalidades atrasadas")
  end
end
