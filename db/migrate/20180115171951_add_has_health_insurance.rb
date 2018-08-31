class AddHasHealthInsurance < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :has_health_insurance, :boolean, default: false
  end
end
