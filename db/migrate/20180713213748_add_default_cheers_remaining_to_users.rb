class AddDefaultCheersRemainingToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :cheers_remaining
    add_column :users, :cheers_remaining, :integer, default: 12, null: false
  end
end
