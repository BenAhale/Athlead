class DeleteAttributesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :attributes
  end
end
