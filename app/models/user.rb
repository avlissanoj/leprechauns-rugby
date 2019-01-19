class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  include AASM
  extend Enumerize

  serialize :training_availability, Array
  enumerize :training_availability, in: %i[
    tuesday_afternoon
    thursday_night
    saturday_morning
  ], multiple: true
  enumerize :donation_availability, in: %i[
    normal
    half
    minimum
    zero
    plus
  ], scope: true
  enumerize :blood_type, in: %i[
    a+
    a-
    b+
    b-
    ab+
    ab-
    o+
    o-
  ], scope: true
  enumerize :sex, in: %i[female male], scope: true

  has_many :health_insurances, inverse_of: :user
  accepts_nested_attributes_for :health_insurances, allow_destroy: true
  has_many :emergency_contacts, inverse_of: :user
  accepts_nested_attributes_for :emergency_contacts, reject_if: :all_blank, allow_destroy: true
  has_many :pendencies

  scope :aged_registrations, -> do
    where(
      "last_update_at > last_age_registration_email_send_at AND last_update_at < ?",
      ENV.fetch("MONTHS_TO_AGE_REGISTRATION").to_i.months.ago
    )
  end

  validates_presence_of :full_name,
                        :sex,
                        :rg,
                        :cpf,
                        :birth,
                        :zip_code,
                        :state,
                        :city,
                        :neighborhood,
                        :address,
                        :number,
                        :email,
                        :phone,
                        :injuries_history,
                        :agree_with_terms_of_statute,
                        :agree_with_terms_of_athlete_manual,
                        :donation_availability,
                        :emergency_contacts, unless: :unfilled?

  validates_inclusion_of :has_health_insurance, in: [true, false], unless: :unfilled?

  validates_presence_of :health_insurances, if: :has_health_insurance?, unless: :unfilled?

  validates_uniqueness_of :nickname, unless: :unfilled?

  aasm do
    state :unfilled, initial: true
    state :need_review
    state :updated

    event :update do
      transitions from: [:unfilled, :need_review], to: :updated
    end

    event :age do
      transitions from: :updated, to: :need_review
    end
  end
end
