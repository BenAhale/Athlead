class AddUserToSchool < ActiveRecord::Migration[6.0]
  def change
    add_reference :schools, :user, null: false, foreign_key: true
  end
end
