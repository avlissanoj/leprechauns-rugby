class RemoveDonationOverFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :donation_overdue
  end
end
