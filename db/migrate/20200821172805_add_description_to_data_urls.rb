class AddDescriptionToDataUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :data_urls, :description, :text, limit: 2000
  end
end
