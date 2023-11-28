class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :synopsis
      t.string :author
      t.string :mood

      t.timestamps
    end
  end
end
