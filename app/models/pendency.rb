class Pendency < ApplicationRecord
  belongs_to :user

  validates_presence_of :date
  validate :uniqueness_by_user_and_month, on: :create

  before_create :send_email

  scope :settled, -> { where(settled: true) }
  scope :unsettled, -> { where(settled: false) }

  def settle!
    update!(settled: true)
  end

  def unsettled?
    !settled
  end

  private 
  def send_email
    if user.pendencies.unsettled.any?
      PendencyMailer.send_multiple_pendencies_email(user).deliver
    else
      PendencyMailer.send_new_pendency_email(user).deliver
    end
  end
  
  #custom_validors
  def uniqueness_by_user_and_month
    if Pendency.where("date_part('month', date) = :date_month AND user_id = :user_id", { date_month: date.month, user_id: user_id }).any?
      errors.add(:date, "Já possui uma inadimplência neste mês")
    end
  end
end
