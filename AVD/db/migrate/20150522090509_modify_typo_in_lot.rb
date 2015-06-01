class ModifyTypoInLot < ActiveRecord::Migration
  def change
    remove_column :lots, :site_numver
    add_column :lots, :site_number, :integer
  end
end
