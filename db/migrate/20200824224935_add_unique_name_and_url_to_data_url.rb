class AddUniqueNameAndUrlToDataUrl < ActiveRecord::Migration[6.0]
  def change
    add_index :data_urls, :source_name, unique: true
    add_index :data_urls, :source_url, unique: true
  end
end
