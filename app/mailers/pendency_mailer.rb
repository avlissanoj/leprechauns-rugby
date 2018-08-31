class PendencyMailer < ApplicationMailer
  def self.send_new_pendency_email(user)
    @user = user
    headers "X-SMTPAPI" => {
      sub: {
        "%logo_lepre_url%" => [image_url("logo_lepre.png")]
      },
      filters: {
        template: {
          settings: {
            enable: 1,
            template_id: 'd-e65b902f5d1e455d8478cbd38ac04336'
          }
        }
      }
    }.to_json
    mail(to: @user.email)
  end

  def self.send_multiple_pendencies_email(user)
    @user = user
    headers "X-SMTPAPI" => {
      sub: {
        "%logo_lepre_url%" => [image_url("logo_lepre.png")]
      },
      filters: {
        template: {
          settings: {
            enable: 1,
            template_id: 'd-2050a7d00b6c427a9e9a05b80ccdfba9'
          }
        }
      }
    }.to_json
    mail(to: @user.email)
  end
end
