class AddFlyerToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :flyers, :item_image, :string
    add_column :flyers, :item_text, :string
  end
end
