class CreatePandemicDataAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :pandemic_data_associations do |t|
      t.references :pandemic, null: false, foreign_key: true
      t.references :data_url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
