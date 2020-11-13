class AddUserToStatistics < ActiveRecord::Migration[6.0]
  def change
    add_reference :statistics, :user, null: false, foreign_key: true
  end
end
