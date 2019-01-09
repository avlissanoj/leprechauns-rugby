class AddSupporterToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :supporter, :boolean, default: false
  end
end
