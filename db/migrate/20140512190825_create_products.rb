class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :link
      t.text :desc

      t.timestamps
    end
  end
end
