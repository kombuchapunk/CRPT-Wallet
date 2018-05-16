class AddAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :btc_address, :string
    add_column :users, :ltc_address, :string
    add_column :users, :doge_address, :string
  end
end
