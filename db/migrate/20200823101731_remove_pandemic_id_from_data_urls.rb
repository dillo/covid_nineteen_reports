class RemovePandemicIdFromDataUrls < ActiveRecord::Migration[6.0]
  def change
    remove_column :data_urls, :pandemic_id
  end
end
