class AddNameIndexToPandemic < ActiveRecord::Migration[6.0]
  def change
    add_index :pandemics, :name, unique: true
  end
end
