class CreatePendencies < ActiveRecord::Migration[5.1]
  def change
    create_table :pendencies do |t|
      t.references :user
      t.boolean :settled, default: false
      t.date :date

      t.timestamps
    end
  end
end
