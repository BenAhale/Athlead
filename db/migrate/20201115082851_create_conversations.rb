class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.references :scout, null: false
      t.references :athlete, null: false

      t.timestamps
    end

    add_foreign_key :conversations, :users, column: :scout_id
    add_foreign_key :conversations, :users, column: :athlete_id
    
  end
end
