class UpdateForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :events, :users

    add_foreign_key :events, :users


  end
end
