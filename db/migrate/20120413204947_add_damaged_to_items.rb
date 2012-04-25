class AddDamagedToItems < ActiveRecord::Migration
  def change
    add_column :items, :damaged, :boolean
  end
end
