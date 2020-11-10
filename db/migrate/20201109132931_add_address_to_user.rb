class AddAddressToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :address, foreign_key: true
  end
end
