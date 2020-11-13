class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.string :position
      t.integer :height
      t.integer :weight
      t.float :points
      t.float :rebounds
      t.float :assists
      t.float :steals
      t.float :blocks

      t.timestamps
    end
  end
end
