class CreateTraits < ActiveRecord::Migration[6.0]
  def change
    create_table :traits do |t|
      t.integer :height
      t.integer :weight
      t.string :position
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
