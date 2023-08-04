class AddFlyerToPictureTwo < ActiveRecord::Migration[7.0]
  def change
    add_column :flyers, :picture_two, :string
  end
end
