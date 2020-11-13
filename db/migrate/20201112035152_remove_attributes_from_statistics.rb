class RemoveAttributesFromStatistics < ActiveRecord::Migration[6.0]
  def change
    remove_column :statistics, :fg_percentage
    remove_column :statistics, :ft_percentage
    remove_column :statistics, :three_percentage
  end
end
