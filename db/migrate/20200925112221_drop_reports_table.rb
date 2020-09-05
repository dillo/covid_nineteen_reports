class DropReportsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :reports
  end
end
