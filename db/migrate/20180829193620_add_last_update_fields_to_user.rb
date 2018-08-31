class AddLastUpdateFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_update_at, :datetime
    add_column :users, :last_age_registration_email_send_at, :datetime
  end
end
