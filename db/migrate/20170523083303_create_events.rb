class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :location
      t.decimal :price
      t.integer :capacity
      t.boolean :includes_food
      t.boolean :indluces_drinks
      t.datetime :starts_at
      t.datetime :end_at
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
