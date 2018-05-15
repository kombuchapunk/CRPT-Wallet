class Def < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :wallet, :string
  end
end
