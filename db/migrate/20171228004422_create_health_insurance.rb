class CreateHealthInsurance < ActiveRecord::Migration[5.1]
  def change
    create_table :health_insurances do |t|
      t.integer :user_id
      t.string :company
      t.string :plan
      t.string :card_number
      t.date :validity
      t.string :preferably_hospital

      t.timestamps
    end
  end
end
