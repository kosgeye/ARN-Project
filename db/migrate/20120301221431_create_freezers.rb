class CreateFreezers < ActiveRecord::Migration
  def change
    create_table :freezers do |t|
      t.string :name

      t.timestamps
    end
  end
end
