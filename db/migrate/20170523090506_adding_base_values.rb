class AddingBaseValues < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :price, :decimal, :default => 0
    change_column :events, :includes_food, :boolean, :default => false
    change_column :events, :indluces_drinks, :boolean, :default => false
    change_column :events, :active, :boolean, :default => true
    rename_column :events, :indluces_drinks, :includes_drinks
    rename_column :events, :end_at, :ends_at
  end
end
