class UpdateForeignKeyEventsUsers < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :events, :users

    add_foreign_key :events, :users, on_delete: :cascade
  end
end
