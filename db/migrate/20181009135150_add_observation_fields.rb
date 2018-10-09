class AddObservationFields < ActiveRecord::Migration[5.1]
  def change
    add_column :emergency_contacts, :observation, :string
    add_column :users, :blood_type, :string
  end
end
