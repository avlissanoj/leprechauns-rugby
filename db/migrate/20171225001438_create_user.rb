class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :nickname
      t.string :rg
      t.string :cpf
      t.date :birth

      t.string :zip_code
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :address
      t.string :number

      t.string :email
      t.string :secondary_email
      t.string :phone
      t.string :home_phone
      t.string :another_phone
      t.string :facebook_link
      t.string :whatsapp

      t.string :injuries_history
      t.string :drug_restrictions
      t.string :chronic_diseases

      t.string :status
      t.string :training_availability
      t.string :donation_availability
      t.boolean :donation_overdue

      t.timestamps
    end
  end
end
