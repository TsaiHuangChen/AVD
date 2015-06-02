class RemoveSiteFromLot < ActiveRecord::Migration
  def change
    remove_column :lots, :site_0_enable
    remove_column :lots, :site_1_enable
    remove_column :lots, :site_2_enable
    remove_column :lots, :site_3_enable
    remove_column :lots, :site_4_enable
    remove_column :lots, :site_5_enable
    remove_column :lots, :site_6_enable
    remove_column :lots, :site_7_enable

    remove_column :lots, :site_0_yield
    remove_column :lots, :site_1_yield
    remove_column :lots, :site_2_yield
    remove_column :lots, :site_3_yield
    remove_column :lots, :site_4_yield
    remove_column :lots, :site_5_yield
    remove_column :lots, :site_6_yield
    remove_column :lots, :site_7_yield

  end
end
