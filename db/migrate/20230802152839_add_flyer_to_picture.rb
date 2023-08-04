class AddFlyerToPicture < ActiveRecord::Migration[7.0]
  def change
    add_column :flyers, :picture, :string
  end
end
