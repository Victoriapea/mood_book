class AddPreviewLinkToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :preview_link, :string
  end
end
