class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :scout, null: false
      t.references :athlete, null: false

      t.timestamps
    end

    add_foreign_key :offers, :users, column: :scout_id
    add_foreign_key :offers, :users, column: :athlete_id

  end
end
