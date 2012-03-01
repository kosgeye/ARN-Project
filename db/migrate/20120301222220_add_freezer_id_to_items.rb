class AddFreezerIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :freezer_id, :integer
  end
end
