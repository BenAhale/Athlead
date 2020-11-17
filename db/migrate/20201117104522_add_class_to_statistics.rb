class AddClassToStatistics < ActiveRecord::Migration[6.0]
  def change
    add_column :statistics, :class, :integer
  end
end
