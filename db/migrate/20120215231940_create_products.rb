class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :meattype
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
