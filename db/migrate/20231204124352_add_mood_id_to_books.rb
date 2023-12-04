class AddMoodIdToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :mood, null: true, foreign_key: true
  end
end
