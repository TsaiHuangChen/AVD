class AddSiteParameterInLot < ActiveRecord::Migration
  def change
    add_column :lots, :site_0_enable, :boolean
    add_column :lots, :site_1_enable, :boolean
    add_column :lots, :site_2_enable, :boolean
    add_column :lots, :site_3_enable, :boolean
    add_column :lots, :site_4_enable, :boolean
    add_column :lots, :site_5_enable, :boolean
    add_column :lots, :site_6_enable, :boolean
    add_column :lots, :site_7_enable, :boolean

    add_column :lots, :site_0_yield, :float
    add_column :lots, :site_1_yield, :float
    add_column :lots, :site_2_yield, :float
    add_column :lots, :site_3_yield, :float
    add_column :lots, :site_4_yield, :float
    add_column :lots, :site_5_yield, :float
    add_column :lots, :site_6_yield, :float
    add_column :lots, :site_7_yield, :float
  end
end
