class RegistrationMailer < ApplicationMailer
  def self.send_age_registration_email(user)
    @user = user
    headers "X-SMTPAPI" => {
      sub: {
        "%logo_lepre_url%" => [image_url("logo_lepr.png")],
        "%edit_user_path%" => [edit_user_url(@user)]
      },
      filters: {
        template: {
          settings: {
            enable: 1,
            template_id: 'd-75b55c0201334105964da34d53389f40'
          }
        }
      }
    }.to_json
    mail(to: @user.email)
  end
end
