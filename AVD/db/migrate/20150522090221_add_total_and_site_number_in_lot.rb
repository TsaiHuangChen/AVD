class AddTotalAndSiteNumberInLot < ActiveRecord::Migration
  def change
    add_column :lots, :total_device_count, :integer
    add_column :lots, :site_numver, :integer
  end
end
