class CreateFlyers < ActiveRecord::Migration[7.0]
  def change
    create_table :flyers do |t|
      t.string :title
      t.text :requirement
      t.text :searching_for
      t.text :gathering_place
      t.references :user, null: false, foreign_key: true
      t.integer :view_count
      t.string :color

      t.timestamps
    end
  end
end
