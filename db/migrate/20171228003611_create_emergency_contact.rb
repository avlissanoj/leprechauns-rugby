class CreateEmergencyContact < ActiveRecord::Migration[5.1]
  def change
    create_table :emergency_contacts do |t|
      t.integer :user_id
      t.string :full_name
      t.string :kinship_degree
      t.string :home_phone
      t.string :phone

      t.timestamps
    end
  end
end
