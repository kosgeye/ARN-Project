class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :weight
      t.integer :product_id
      t.float :price

      t.timestamps
    end
  end
end
