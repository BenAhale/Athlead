class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.references :address, null: false, foreign_key: true
      t.integer :division

      t.timestamps
    end
  end
end
