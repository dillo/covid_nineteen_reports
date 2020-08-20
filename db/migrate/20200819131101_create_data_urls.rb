class CreateDataUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :data_urls do |t|
      t.string :source_name
      t.string :source_url
      t.string :data_type
      t.references :pandemic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
