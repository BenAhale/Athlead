class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.float :points
      t.float :rebounds
      t.float :assists
      t.float :steals
      t.float :blocks
      t.float :fg_percentage
      t.float :three_percentage
      t.float :ft_percentage
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
