class AddReadToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :read, :boolean
  end
end
