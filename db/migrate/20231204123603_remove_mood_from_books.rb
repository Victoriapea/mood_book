class RemoveMoodFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :mood, :string
  end
end
