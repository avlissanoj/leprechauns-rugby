namespace :registrations do
  desc "Send age registration email"
  task age: :environment do
    User.aged_registrations.each do |user|
      user.age!
      RegistrationMailer.send_age_registration_email(user).deliver
    end
  end
end
