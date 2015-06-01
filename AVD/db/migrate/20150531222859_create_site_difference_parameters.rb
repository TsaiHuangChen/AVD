class CreateSiteDifferenceParameters < ActiveRecord::Migration
  def change
    drop_table :site_difference_parameters

    create_table :site_difference_parameters do |t|
      t.string :site_lot
      t.integer :site_serial
      t.boolean :site_enable
      t.float :site_yield

      t.timestamps null: false
    end
  end
end