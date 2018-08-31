class AddTermsFields < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :agree_with_terms_of_statute, :boolean, default: false
    add_column :users, :agree_with_terms_of_athlete_manual, :boolean, default: false
  end
end
